<?php

namespace com\novaconcept\page;

use com\novaconcept\utility\RestBuilder;
use com\novaconcept\utility\WebConfig;

class QuizPanel extends AbstractPage {
    
    public function front() {
        if ($this->builder->hasToken() == FALSE) {
            $this->display("LoginPage.tpl");
            return;
        }
        if (!$this->authorize(["is_user"]) &&
                !$this->authorize(["is_agency_admin"]) &&
                !$this->authorize(["is_group_admin"]) &&
                !$this->authorize(["is_corpo_admin"]) ||
                $_SESSION['accountInfo'] == '') {
            $this->display("error/ForbiddenError.tpl");
            return;
        }

        $this->builder->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                ->addPathParam(WebConfig::getEnvironment()->version)
                ->addPathParam('account_info')
                ->addPathParam($_SESSION['accountInfo'])
                ->addPathParam('quiz')
                ->setHttpMethod(RestBuilder::GET)
                ->excecute();
        $this->data->agency = json_decode($this->builder->getResponse());

        if ($this->authorize(["is_corpo_admin"])) {
            $this->builder->reset();
            $this->builder->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                    ->addPathParam(WebConfig::getEnvironment()->version)
                    ->addPathParam('account_info')
                    ->addPathParam($_SESSION['accountInfo'])
                    ->addPathParam('corpoQuiz')
                    ->setHttpMethod(RestBuilder::GET)
                    ->excecute();
            $this->data->all = json_decode($this->builder->getResponse());
            $this->builder->reset();
            $this->builder->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                    ->addPathParam(WebConfig::getEnvironment()->version)
                    ->addPathParam('account_info')
                    ->addPathParam($_SESSION['accountInfo'])
                    ->addPathParam('allAgencies')
                    ->setHttpMethod(RestBuilder::GET)
                    ->excecute();

            $this->data->agencies = json_decode($this->builder->getResponse());
            if ($this->builder->getResponseInfo()["http_code"] != 200) {
                $this->display("error/ForbiddenError.tpl");
                return;
            }
        }
        $this->view->is_quiz_active = true;
        $this->view->title = $_SESSION['accountName'] . " - Quiz";
        $this->view->center = "com/novaconcept/page/smarty/quiz_panel/QuizFront.tpl";
        $this->display("includes/General.tpl");
    }

    public function quiz() {
        if ($this->builder->hasToken() == FALSE) {
            $this->display("LoginPage.tpl");
            return;
        }
        if (!$this->authorize(["is_user"]) &&
                !$this->authorize(["is_agency_admin"]) &&
                !$this->authorize(["is_group_admin"]) &&
                !$this->authorize(["is_corpo_admin"]) ||
                $_SESSION['accountInfo'] == '') {
            $this->display("error/ForbiddenError.tpl");
            return;
        }

        $this->builder->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                ->addPathParam(WebConfig::getEnvironment()->version)
                ->addPathParam('account_info')
                ->addPathParam($_SESSION['accountInfo'])
                ->addPathParam('quiz')
                ->addPathParam($this->request->getPathParamByName('id'))
                ->setHttpMethod(RestBuilder::GET)
                ->excecute();
        $this->data = json_decode($this->builder->getResponse());
        if ($this->builder->getResponseInfo()["http_code"] != 200) {
            header("Location: ../");
            return;
        }
        if (isset($this->data->RESULT) && $this->data->RESULT == TRUE) {
            $this->display("error/ForbiddenError.tpl");
            return;
        }

        $this->data->quizData = json_decode($this->data->QUIZ_DATA);
        if (empty($_SESSION['quizStartTime'])) {
            $_SESSION['quizStartTime'] = time();
        }
        $this->display("quiz_panel/Quiz.tpl");
    }

    public function addQuiz() {
        if ($this->builder->hasToken() == FALSE) {
            $this->display("LoginPage.tpl");
            return;
        }
        if (!$this->authorize(["is_corpo_admin"]) ||
                $_SESSION['accountInfo'] == '') {
            $this->display("error/ForbiddenError.tpl");
            return;
        }
        $this->builder->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                ->addPathParam(WebConfig::getEnvironment()->version)
                ->addPathParam('account_info')
                ->addPathParam($_SESSION['accountInfo'])
                ->addPathParam('allAgencies')
                ->setHttpMethod(RestBuilder::GET)
                ->excecute();

        $this->data = json_decode($this->builder->getResponse());
        if ($this->builder->getResponseInfo()["http_code"] != 200) {
            $this->display("error/ForbiddenError.tpl");
            return;
        }

        $this->view->is_quiz_active = true;
        $this->view->title = $_SESSION['accountName'] . " - Quiz";
        $this->view->center = "com/novaconcept/page/smarty/quiz_panel/addQuiz.tpl";
        $this->display("includes/General.tpl");
    }

    public function resultsQuiz() {

        if ($this->builder->hasToken() == FALSE) {
            $this->display("LoginPage.tpl");
            return;
        }

        if (!$this->authorize(["is_user"]) &&
                !$this->authorize(["is_agency_admin"]) &&
                !$this->authorize(["is_group_admin"]) &&
                !$this->authorize(["is_corpo_admin"]) ||
                $_SESSION['accountInfo'] == '') {
            $this->display("error/ForbiddenError.tpl");
            return;
        }

        $this->builder->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                ->addPathParam(WebConfig::getEnvironment()->version)
                ->addPathParam('account_info')
                ->addPathParam($_SESSION['accountInfo'])
                ->addPathParam('quiz')
                ->addPathParam($this->request->getPathParamByName('id'))
                ->setHttpMethod(RestBuilder::GET)
                ->excecute();
        $this->data = json_decode($this->builder->getResponse());

        if ($this->builder->getResponseInfo()["http_code"] != 200) {
            $this->display("error/ForbiddenError.tpl");
            return;
        }
        
        if ( !isset($this->data->RESULT_PROGRESS_ID) ) {
            $this->display("error/ForbiddenError.tpl");
            return;
        }
        
        $this->view->is_quiz_active = true;
        $this->view->title = $_SESSION['accountName'] . " - Results";
        $this->data->quizData = json_decode($this->data->QUIZ_DATA);
        $this->display("quiz_panel/ResultQuiz.tpl");
    }

    public function quizEdit() {

        if ($this->builder->hasToken() == FALSE) {
            $this->display("LoginPage.tpl");
            return;
        }

        if (!$this->authorize(["is_corpo_admin"]) ||
                $_SESSION['accountInfo'] == '') {
            $this->display("error/ForbiddenError.tpl");
            return;
        }

        if (!empty($_POST)) {
            $this->builder->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                    ->addPathParam(WebConfig::getEnvironment()->version)
                    ->addPathParam('account_info')
                    ->addPathParam($_SESSION['accountInfo'])
                    ->addPathParam('quiz')
                    ->addPathParam($this->request->getPathParamByName('id'))
                    ->setPostData($_POST)
                    ->setHttpMethod(RestBuilder::PUT)
                    ->excecute();
            /* if ($this->builder->getResponseInfo()["http_code"] != 200) {
              //header("Location: ../");
              return;
              } */
        }

        $this->builder->reset();
        $this->builder->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                ->addPathParam(WebConfig::getEnvironment()->version)
                ->addPathParam('account_info')
                ->addPathParam($_SESSION['accountInfo'])
                ->addPathParam('quiz')
                ->addPathParam($this->request->getPathParamByName('id'))
                ->setHttpMethod(RestBuilder::GET)
                ->excecute();
        $this->data = json_decode($this->builder->getResponse());
        if ($this->builder->getResponseInfo()["http_code"] != 200) {
            header("Location: ../");
            return;
        }

        $this->builder->reset();
        $this->builder->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                ->addPathParam(WebConfig::getEnvironment()->version)
                ->addPathParam('account_info')
                ->addPathParam($_SESSION['accountInfo'])
                ->addPathParam('quiz')
                ->addPathParam($this->request->getPathParamByName('id'))
                ->addPathParam('agencies')
                ->setHttpMethod(RestBuilder::GET)
                ->excecute();

        $this->data->agencies = json_decode($this->builder->getResponse());
        if ($this->builder->getResponseInfo()["http_code"] != 200) {
            $this->display("error/ForbiddenError.tpl");
            return;
        }

        $this->view->is_quiz_active = true;
        $this->view->title = $_SESSION['accountName'] . " - Quiz";
        $this->view->center = "com/novaconcept/page/smarty/quiz_panel/editQuiz.tpl";
        $this->display("includes/General.tpl");
    }

}

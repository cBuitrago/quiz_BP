<?php

namespace com\novaconcept\page;

use com\novaconcept\utility\RestBuilder;
use com\novaconcept\utility\WebConfig;
use stdClass;

class DepartmentPanel extends AbstractPage {

    public function corpo() {
        if ($this->builder->hasToken() == FALSE) {
            $this->display("LoginPage.tpl");
            return;
        }
        if (!$this->authorize(["is_corpo_admin"]) || $_SESSION['accountInfo'] == '') {
            $this->display("error/ForbiddenError.tpl");
            return;
        }

        $this->builder->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                ->addPathParam(WebConfig::getEnvironment()->version)
                ->addPathParam('account_info')
                ->addPathParam($_SESSION['accountInfo'])
                ->addPathParam('corpo')
                ->setHttpMethod(RestBuilder::GET)
                ->excecute();
        if ($this->builder->getResponseInfo()["http_code"] != 200) {
            $this->display("error/ForbiddenError.tpl");
            return;
        }
        $this->data = json_decode($this->builder->getResponse());

        $this->view->title = $_SESSION['accountName'] . " - Groups";
        $this->view->center = "com/novaconcept/page/smarty/department_panel/Groups.tpl";
        $this->display("includes/General.tpl");
    }

    public function group() {
        if ($this->builder->hasToken() == FALSE) {
            $this->display("LoginPage.tpl");
            return;
        }
        if (!$this->authorize(["is_group_admin"]) &&
                !$this->authorize(["is_corpo_admin"]) ||
                $_SESSION['accountInfo'] == '') {
            $this->display("error/ForbiddenError.tpl");
            return;
        }

        $this->builder->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                ->addPathParam(WebConfig::getEnvironment()->version)
                ->addPathParam('account_info')
                ->addPathParam($_SESSION['accountInfo'])
                ->addPathParam('group')
                ->addPathParam($this->request->getPathParamByName('id'))
                ->setHttpMethod(RestBuilder::GET)
                ->excecute();
        if ($this->builder->getResponseInfo()["http_code"] != 200) {
            $this->display("error/ForbiddenError.tpl");
            return;
        }
        $this->data = json_decode($this->builder->getResponse());

        $this->view->title = $_SESSION['accountName'] . " - Group";
        $this->view->center = "com/novaconcept/page/smarty/department_panel/Group.tpl";
        $this->display("includes/General.tpl");
    }

    public function agency() {
        if ($this->builder->hasToken() == FALSE) {
            $this->display("LoginPage.tpl");
            return;
        }
        if (!$this->authorize(["is_group_admin"]) &&
                !$this->authorize(["is_corpo_admin"]) &&
                !$this->authorize(["is_agency_admin"]) ||
                $_SESSION['accountInfo'] == '') {
            $this->display("error/ForbiddenError.tpl");
            return;
        }

        $this->builder->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                ->addPathParam(WebConfig::getEnvironment()->version)
                ->addPathParam('account_info')
                ->addPathParam($_SESSION['accountInfo'])
                ->addPathParam('agency')
                ->addPathParam($this->request->getPathParamByName('id'))
                ->setHttpMethod(RestBuilder::GET)
                ->excecute();

        if ($this->builder->getResponseInfo()["http_code"] != 200) {
            $this->display("error/ForbiddenError.tpl");
            return;
        }
        $this->data = json_decode($this->builder->getResponse());

        $this->view->title = $_SESSION['accountName'] . " - Agency";
        $this->view->center = "com/novaconcept/page/smarty/department_panel/Agency.tpl";
        $this->display("includes/General.tpl");
    }

}

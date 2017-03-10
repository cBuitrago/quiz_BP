<?php

namespace com\novaconcept\page;

use com\novaconcept\utility\RestBuilder;
use com\novaconcept\utility\WebConfig;

class UserPanel extends AbstractPage {

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
                ->addPathParam('department_info')
                ->addPathParam('allUsers')
                ->setHttpMethod(RestBuilder::GET)
                ->excecute();
        $this->data = json_decode($this->builder->getResponse());
        
        $this->view->is_user_active = true;
        $this->view->title = $_SESSION['accountName'] . " - User";
        $this->view->center = "com/novaconcept/page/smarty/user_panel/UserFront.tpl";
        $this->display("includes/General.tpl");
    }

    public function edit() {
        if ($this->builder->hasToken() == FALSE) {
            $this->display("LoginPage.tpl");
            return;
        }
        if (!$this->authorize(["is_agency_admin"]) &&
                !$this->authorize(["is_group_admin"]) &&
                !$this->authorize(["is_corpo_admin"]) || $_SESSION['accountInfo'] == '') {
            $this->display("error/ForbiddenError.tpl");
            return;
        }

        $this->builder->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                ->addPathParam(WebConfig::getEnvironment()->version)
                ->addPathParam('account_info')
                ->addPathParam($_SESSION['accountInfo'])
                ->addPathParam('user_info')
                ->addPathParam($this->request->getPathParamByName('id'))
                ->setHttpMethod(RestBuilder::GET)
                ->addQueryParam("includes", "department_info,user_authorization,user_authentication,department_authorization,user_account")
                ->excecute();

        if ($this->builder->getResponseInfo()["http_code"] != 200) {
            $this->display("error/ForbiddenError.tpl");
            return;
        }
        $this->data = json_decode($this->builder->getResponse());

        $this->builder->reset()
                ->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                ->addPathParam(WebConfig::getEnvironment()->version)
                ->addPathParam('account_info')
                ->addPathParam($_SESSION['accountInfo'])
                ->addPathParam('department_info')
                ->addPathParam('agency')
                ->setHttpMethod(RestBuilder::GET)
                ->excecute();
        $this->data->agencies = json_decode($this->builder->getResponse());
        if ($this->builder->getResponseInfo()["http_code"] != 200) {
            $this->display("error/ForbiddenError.tpl");
            return;
        }

        $this->view->is_user_active = true;
        $this->view->title = $_SESSION['accountName'] . " - User";
        $this->view->center = "com/novaconcept/page/smarty/user_panel/UserEdit.tpl";
        $this->display("includes/General.tpl");
    }

    public function editProfile() {
        if ($this->builder->hasToken() == FALSE) {
            $this->display("LoginPage.tpl");
            return;
        }

        if (!$this->authorize(["is_agency_admin"]) &&
                !$this->authorize(["is_group_admin"]) &&
                !$this->authorize(["is_corpo_admin"]) &&
                !$this->authorize(["is_user"]) ||
                $_SESSION['accountInfo'] == '') {
            $this->display("error/ForbiddenError.tpl");
            return;
        }

        $this->view->is_user_active = true;
        $this->view->title = "Personal Info";
        $this->display("user_panel/EditProfile.tpl");
    }

    public function userFind() {
        if ($this->builder->hasToken() == FALSE) {
            $this->display("LoginPage.tpl");
            return;
        }

        if (!$this->authorize(["can_manage", "can_manage_users"]) || $_SESSION['accountInfo'] == '') {
            $this->display("error/ForbiddenError.tpl");
            return;
        }

        if ($this->request->getQueryParam("search_term") !== NULL) {
            $page = $this->request->getQueryParam("page");
            $perPage = $this->request->getQueryParam("per_page");
            $searchTerm = $this->request->getQueryParam("search_term");
            $this->builder->reset()
                    ->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                    ->addPathParam(WebConfig::getEnvironment()->version)
                    ->addPathParam('account_info')
                    ->addPathParam($_SESSION['accountInfo'])
                    ->addPathParam('user_info')
                    ->addPathParam('find_email')
                    ->setHttpMethod(RestBuilder::GET)
                    ->addQueryParam("page", $page)
                    ->addQueryParam("per_page", $perPage)
                    ->addQueryParam("search_term", $searchTerm)
                    ->excecute();

            $this->data = json_decode($this->builder->getResponse());
        }

        $this->view->is_user_active = true;
        $this->view->title = $_SESSION['accountName'] . " - User";
        $this->view->center = "com/novaconcept/page/smarty/user_panel/UserFind.tpl";
        $this->display("includes/General.tpl");
    }

    public function editPassword() {
        if ($this->builder->hasToken() == FALSE) {
            $this->display("LoginPage.tpl");
            return;
        }

        $this->view->is_user_active = true;
        $this->view->title = "Change Password";
        $this->display("user_panel/ChangePassword.tpl");
    }

    private function authorizations($department, $departmentAuthorization) {
        foreach ($departmentAuthorization as $authorization) {
            if ($department->id == $authorization->departmentId) {
                $department->isRecursive = $authorization->isRecursive;
                $department->authorizationId = $authorization->id;
            }
        }
        if (isset($department->childrenCollection)) {
            foreach ($department->childrenCollection as $children) {
                $this->authorizations($children, $departmentAuthorization);
            }
        }
    }
}
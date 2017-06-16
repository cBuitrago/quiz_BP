<?php

namespace com\novaconcept\page;

use com\novaconcept\utility\RestBuilder;
use com\novaconcept\utility\WebConfig;

class UserPanel extends AbstractPage {

    public function front() {
        $this->view->title = "User";
        if ($this->builder->hasToken() == FALSE) {
            header("Location: " . WebConfig::getEnvironment()->webPath . "/" . $this->view->rout);
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
        $this->view->title = "User";
        if ($this->builder->hasToken() == FALSE) {
            header("Location: " . WebConfig::getEnvironment()->webPath . "/" . $this->view->rout);
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
        $this->view->title = "Personal Info";
        if ($this->builder->hasToken() == FALSE) {
            header("Location: " . WebConfig::getEnvironment()->webPath . "/" . $this->view->rout);
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
        $this->display("user_panel/EditProfile.tpl");
    }

    public function editPassword() {
        $this->view->title = "Change Password";
        if ($this->builder->hasToken() == FALSE) {
            header("Location: " . WebConfig::getEnvironment()->webPath . "/" . $this->view->rout);
            return;
        }

        $this->view->is_user_active = true;
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

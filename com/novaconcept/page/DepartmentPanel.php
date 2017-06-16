<?php

namespace com\novaconcept\page;

use com\novaconcept\utility\RestBuilder;
use com\novaconcept\utility\WebConfig;
use stdClass;

class DepartmentPanel extends AbstractPage {

    public function corpo() {
        $this->view->title = "Corpo";
        if ($this->builder->hasToken() == FALSE) {
            header("Location: " . WebConfig::getEnvironment()->webPath . "/" . $this->view->rout);
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

        $this->builder->reset()
                ->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                ->addPathParam(WebConfig::getEnvironment()->version)
                ->addPathParam('account_info')
                ->addPathParam($_SESSION['accountInfo'])
                ->addPathParam('settings')
                ->setHttpMethod(RestBuilder::GET)
                ->excecute();

        if ($this->builder->getResponseInfo()["http_code"] != 200) {
            $this->display("error/ForbiddenError.tpl");
            return;
        }
        $this->data->settings = json_decode($this->builder->getResponse());

        if (!empty($_FILES) && $_FILES['imgCompany']['size'] > 0 && $_FILES['imgCompany']['size'] < 800000) {
            $fileName = md5($_FILES['imgCompany']['name']);
            $type = substr($_FILES['imgCompany']['name'], strrpos($_FILES['imgCompany']['name'], "."));
            if ($type == ".jpg" || $type == ".png" || $type == ".jpeg" || $type == ".gif") {
                $uploadFIle = WebConfig::getEnvironment()->webDirectory . WebConfig::getEnvironment()->webPath . WebConfig::getEnvironment()->uploadFolder . '/' . $fileName;
                if (rename($_FILES['imgCompany']['tmp_name'], $uploadFIle . $type)) {
                    shell_exec('chmod 665 ' . $uploadFIle . $type);
                    $this->data->settings->logo = $fileName . $type;
                    $this->builder->reset()
                            ->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                            ->addPathParam(WebConfig::getEnvironment()->version)
                            ->addPathParam('account_info')
                            ->addPathParam($_SESSION['accountInfo'])
                            ->addPathParam('settings')
                            ->setPostData($this->data->settings)
                            ->setHttpMethod(RestBuilder::PUT)
                            ->excecute();
                    if ($this->builder->getResponseInfo()["http_code"] != 200) {
//Message
//return;
                    }
                }
            }
        }

        $_SESSION['accountLogo'] = $this->data->settings->logo;
        $_SESSION['accountAside'] = $this->data->settings->colors->aside;
        $_SESSION['accountBtn'] = $this->data->settings->colors->principal;
        $_SESSION['accountBtnCancel'] = $this->data->settings->colors->btn_cancel;
        $_SESSION['accountPrincipal'] = $this->data->settings->colors->principal;
        $_SESSION['accountNav'] = $this->data->settings->colors->nav;
        $_SESSION['accountNav2'] = $this->data->settings->colors->nav2;

        $this->view->is_corpo_active = true;
        $this->view->title = $_SESSION['accountName'] . " - Corpo";
        $this->view->center = "com/novaconcept/page/smarty/department_panel/Groups.tpl";
        $this->display("includes/General.tpl");
    }

    public function group() {
        $this->view->title = "Groupe";
        if ($this->builder->hasToken() == FALSE) {
            header("Location: " . WebConfig::getEnvironment()->webPath . "/" . $this->view->rout);
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
                ->addPathParam('corpo')
                ->setHttpMethod(RestBuilder::GET)
                ->excecute();
        if ($this->builder->getResponseInfo()["http_code"] != 200) {
            $this->display("error/ForbiddenError.tpl");
            return;
        }
        $this->data = json_decode($this->builder->getResponse());

        $this->view->is_group_active = true;
        $this->view->title = $_SESSION['accountName'] . " - Groupe";
        $this->view->center = "com/novaconcept/page/smarty/department_panel/Group.tpl";
        $this->display("includes/General.tpl");
    }

    public function groupId() {
        $this->view->title = "Groupe";
        if ($this->builder->hasToken() == FALSE) {
            header("Location: " . WebConfig::getEnvironment()->webPath . "/" . $this->view->rout);
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

        $this->view->is_group_active = true;
        $this->view->title = $_SESSION['accountName'] . " - Groupe";
        $this->view->center = "com/novaconcept/page/smarty/department_panel/GroupId.tpl";
        $this->display("includes/General.tpl");
    }

    public function agency() {
        $this->view->title = "Agence";
        if ($this->builder->hasToken() == FALSE) {
            header("Location: " . WebConfig::getEnvironment()->webPath . "/" . $this->view->rout);
            return;
        }
        if (!$this->authorize(["is_group_admin"]) &&
                !$this->authorize(["is_corpo_admin"]) ||
                $_SESSION['accountInfo'] == '') {
            $this->display("error/ForbiddenError.tpl");
            return;
        }

        $query = ( $this->authorize(["is_group_admin"]) ) ? "group" : "corpo";

        $this->builder->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                ->addPathParam(WebConfig::getEnvironment()->version)
                ->addPathParam('account_info')
                ->addPathParam($_SESSION['accountInfo'])
                ->addPathParam('allAgencies')
                ->setHttpMethod(RestBuilder::GET)
                ->excecute();

        if ($this->builder->getResponseInfo()["http_code"] != 200) {
            $this->display("error/ForbiddenError.tpl");
            return;
        }
        $this->data->agency = json_decode($this->builder->getResponse());

        $this->builder->reset();
        $this->builder->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                ->addPathParam(WebConfig::getEnvironment()->version)
                ->addPathParam('account_info')
                ->addPathParam($_SESSION['accountInfo'])
                ->addPathParam($query)
        ;
        if ($query == 'group') {
            $this->builder->addPathParam($_SESSION['group']);
        }
        $this->builder->setHttpMethod(RestBuilder::GET)
                ->excecute();
        if ($this->builder->getResponseInfo()["http_code"] != 200) {
            $this->display("error/ForbiddenError.tpl");
            return;
        }
        $this->data->group = json_decode($this->builder->getResponse());

        $this->view->is_agency_active = true;
        $this->view->title = $_SESSION['accountName'] . " - Agence";
        $this->view->center = "com/novaconcept/page/smarty/department_panel/Agency.tpl";
        $this->display("includes/General.tpl");
    }

    public function agencyId() {
        $this->view->title = "Agence";
        if ($this->builder->hasToken() == FALSE) {
            header("Location: " . WebConfig::getEnvironment()->webPath . "/" . $this->view->rout);
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

        $this->view->is_agency_active = true;
        $this->view->title = $_SESSION['accountName'] . " - Agence";
        $this->view->center = "com/novaconcept/page/smarty/department_panel/AgencyId.tpl";
        $this->display("includes/General.tpl");
    }

}

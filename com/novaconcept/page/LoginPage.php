<?php

namespace com\novaconcept\page;

use com\novaconcept\utility\RestBuilder;
use com\novaconcept\utility\WebConfig;

class LoginPage extends AbstractPage {

    public function getLogin() {
        $this->view->title = "Ouverture de session";
        $this->display("LoginPageNova.tpl");
    }
    
    public function loginCompany() {
        $data = $this->request->getPathParamByName('accountName');
        $this->builder->setEndpoint(WebConfig::getEnvironment()->endpointCore)
                ->addPathParam(WebConfig::getEnvironment()->version)
                ->addPathParam('exist_account_info')
                ->setPostData($data)
                ->setHttpMethod(RestBuilder::POST)
                ->excecute();
        if ($this->builder->getResponseInfo()["http_code"] != 200) {
            $this->display("error/NotFoundError.tpl");
            return;
        }
        $this->data = json_decode($this->builder->getResponse());
        
        $this->view->title = "Ouverture de session";
        $this->display("LoginPage.tpl");
    }

    public function getLogout() {
        $rout = $_SESSION["accountName"];
        session_unset();
        session_destroy();
        header("Location: " . WebConfig::getEnvironment()->webPath . "/" . $rout);
    }

}

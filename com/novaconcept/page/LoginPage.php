<?php

namespace com\novaconcept\page;

class LoginPage extends AbstractPage {

    public function getLogin() {
        $this->view->title = "Login";
        $this->display("LoginPage.tpl");
    }

    public function getLogout() {
        session_unset();
        session_destroy();
        $this->view->title = "Login";
        $this->display("LoginPage.tpl");
    }

}

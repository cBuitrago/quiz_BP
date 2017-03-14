<?php

namespace com\novaconcept\page;

use com\novaconcept\utility\WebConfig;

class AdminPanel extends AbstractPage {

    public function selectAccount() {
        $this->view->title = "Admin";
        if ($this->builder->hasToken() == FALSE) {
            $this->display("LoginPage.tpl");
            return;
        }
        if (!$this->authorize(["is_user"]) &&
                !$this->authorize(["is_agency_admin"]) &&
                !$this->authorize(["is_group_admin"]) &&
                !$this->authorize(["is_corpo_admin"])) {
            $this->display("error/ForbiddenError.tpl");
            return;
        }

        $this->data->accountInfo = $_SESSION["accountInfo"];
        $this->data->authorized = array();

        $this->view->title = $_SESSION['accountName'] . " - Admin";
        $this->view->center = "com/novaconcept/page/smarty/AdminAccountFront.tpl";
        $this->display("includes/General.tpl");
    }

}

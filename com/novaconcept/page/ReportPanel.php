<?php

namespace com\novaconcept\page;

use com\novaconcept\utility\RestBuilder;
use com\novaconcept\utility\WebConfig;

class ReportPanel extends AbstractPage {

    public function pdfGenerator() {
        $this->view->title = "Reports";
        if ($this->builder->hasToken() == FALSE) {
            header("Location: " . WebConfig::getEnvironment()->webPath . "/" . $this->view->rout);
            return;
        }

        if (!$this->authorize(["is_agency_admin"]) &&
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
                ->addPathParam('allQuiz')
                ->setHttpMethod(RestBuilder::GET)
                ->excecute();
        $this->data = json_decode($this->builder->getResponse());

        $this->view->is_report_active = true;
        $this->view->title = $_SESSION['accountName'] . " - Reports";
        $this->display("report_panel/ReportFront.tpl");
    }

}

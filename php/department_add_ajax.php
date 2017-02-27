<?php

require 'base_ajax.php';

use com\novaconcept\utility\RestBuilder;

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/account_info/" . $_SESSION['accountInfo'] . "/department_info")
        ->setHttpMethod(RestBuilder::POST)
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($request->getPostData())
        ->excecute();

if ($restBuilder->getResponseInfo()["http_code"] == 201) {
    echo "true";
} else {
    echo "false";
}
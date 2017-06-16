<?php

require 'base_ajax.php';

use com\novaconcept\utility\RestBuilder;
use DateTime;

$data = $request->getPostData();

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/account_info/" . $_SESSION['accountInfo'] . "/averages_answers")
        ->setHttpMethod(RestBuilder::POST)
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($data)
        ->excecute();

if ($restBuilder->getResponseInfo()["http_code"] == 200) {
    echo $restBuilder->getResponse();
} else {
    echo 'false';
}
    
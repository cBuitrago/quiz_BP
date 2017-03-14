<?php

require 'base_ajax.php';

use com\novaconcept\utility\RestBuilder;

$id = $request->getPostData();

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/account_info/" . $_SESSION['accountInfo'] . "/agency/" . $id)
        ->setHttpMethod(RestBuilder::GET)
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->excecute();

if ($restBuilder->getResponseInfo()["http_code"] == 200) {
    echo $restBuilder->getResponse();
} else {
    echo "FALSE";
}

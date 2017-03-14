<?php

require 'base_ajax.php';

$data = $request->getPostData();

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/account_info/" . $_SESSION['accountInfo'] . "/create_users")
        ->setHttpMethod("POST")
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($data)
        ->excecute();

if ($restBuilder->getResponseInfo()["http_code"] == 200) {
    //echo "ok";
    print_r($restBuilder->getResponseInfo());
    print_r($restBuilder->getResponse());
} else {
    //echo "false";
    print_r($restBuilder->getResponse());
    print_r($restBuilder->getResponseInfo());
}
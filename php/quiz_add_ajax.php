<?php

require 'base_ajax.php';

$data = $request->getPostData();

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/account_info/" . $_SESSION['accountInfo'] . "/quiz")
        ->setHttpMethod("POST")
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($data)
        ->excecute();
print_r($restBuilder->getResponse());
print_r($restBuilder->getResponseInfo());

if ($restBuilder->getResponseInfo()["http_code"] == 201) {
    echo "true";
} else {
    echo "false";
}
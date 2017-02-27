<?php

require 'base_ajax.php';

$request->getPostData();

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/account_info/" . $_SESSION['accountInfo'] . "/user_authorization/" . $request->getPostData()->id)
        ->setHttpMethod("PUT")
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($request->getPostData())
        ->excecute();

if ($restBuilder->getResponseInfo()["http_code"] == 200) {
    echo "true";
} else {
    echo "false";
}

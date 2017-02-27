<?php

require 'base_ajax.php';

$getData = $request->getPostData();
$setData = new stdClass();
$setData->userAuthentication = $getData->userAuthentication;
$setData->username = $getData->username;
$setData->firstName = $getData->firstName;
$setData->name = $getData->name;
$setData->id = $getData->id;

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/account_info/" . $_SESSION['accountInfo'] . "/user_info/" . $setData->id)
        ->setHttpMethod("PUT")
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($setData)
        ->excecute();
if ($restBuilder->getResponseInfo()["http_code"] == 200) {
    echo "true";
} else {
    echo "false";
}
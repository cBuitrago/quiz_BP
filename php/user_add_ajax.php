<?php

require 'base_ajax.php';

$data = $request->getPostData();

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/account_info/" . $_SESSION['accountInfo'] . "/user_info")
        ->setHttpMethod("POST")
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($data)
        ->excecute();
if ($restBuilder->getResponseInfo()["http_code"] == 201) {
    $id = json_decode($restBuilder->getResponse());
    echo $id->id;
} else if ($restBuilder->getResponseInfo()["http_code"] == 409) {
    echo "user_exists";
} else {
    echo "false";
}
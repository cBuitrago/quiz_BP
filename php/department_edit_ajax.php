<?php

require 'base_ajax.php';

$data = $request->getPostData();
if ($data->parent === 0)
    $data->parent = NULL;

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/account_info/" . $_SESSION['accountInfo'] . "/department_info/" . $data->id)
        ->setHttpMethod("PUT")
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($data)
        ->excecute();

if ($restBuilder->getResponseInfo()["http_code"] == 200) {
    echo "true";
} else {
    echo "false";
}
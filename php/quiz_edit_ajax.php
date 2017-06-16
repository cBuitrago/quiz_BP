<?php

require 'base_ajax.php';

$data = $request->getPostData();

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/account_info/" . $_SESSION['accountInfo'] . "/quiz/" . $data->ID)
        ->setHttpMethod("PUT")
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($data)
        ->excecute();
if ($restBuilder->getResponseInfo()["http_code"] == 200) {
    echo "true";
} else {
    echo "false";
}
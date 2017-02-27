<?php

require 'base_ajax.php';

$getData = $request->getPostData();

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/account_info/" . $_SESSION['accountInfo'] . "/user_info/" . $getData->id)
        ->setHttpMethod("DELETE")
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->excecute();

if ($restBuilder->getResponseInfo()["http_code"] == 200) {
    echo 'true';
} else {
    echo $restBuilder->getResponseInfo()["http_code"];
}
session_write_close();

<?php

require 'base_ajax.php';

$data = new stdClass();
$data->id = $request->getPostData()->id;
$headers = getallheaders();
$data->password = base64_decode($headers["Authorization"]);
$data->forceChange = TRUE;

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/account_info/" . $_SESSION['accountInfo'] . "/user_authentication/" . $data->id)
        ->setHttpMethod("PUT")
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($data)
        ->excecute();

if ($restBuilder->getResponseInfo()["http_code"] == 200) {
    echo "true";
} else {
    echo "false";
}
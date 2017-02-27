<?php

require 'base_ajax.php';

$postData = new stdClass();
$headers = getallheaders();
$postData->password = base64_decode($headers["Authorization"]);
$postData->forceChange = FALSE;

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/user_authentication")
        ->setHttpMethod("PUT")
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($postData)
        ->excecute();

if ($restBuilder->getResponseInfo()["http_code"] == 200) {
    echo 'true';
} else {
    echo "false";
}
session_write_close();

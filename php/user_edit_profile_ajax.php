<?php

require 'base_ajax.php';

$postData = new stdClass();
$postData = $request->getPostData();

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/user_authentication")
        ->setHttpMethod("PUT")
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($postData)
        ->excecute();

if ($restBuilder->getResponseInfo()["http_code"] == 200) {
    $response = json_decode($restBuilder->getResponse());
    $_SESSION["userInfo"] = $response;
    echo 'true';
} else {
    echo "false";
}
session_write_close();
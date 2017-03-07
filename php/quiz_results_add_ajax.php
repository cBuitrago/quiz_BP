<?php

require 'base_ajax.php';
use DateTime;
$data = $request->getPostData();
$data->START_DATE = $_SESSION['quizStartTime'];
$data->END_DATE = time(); 

unset($_SESSION['quizStartTime']);

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/account_info/" . $_SESSION['accountInfo'] . "/quizResults")
        ->setHttpMethod("POST")
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($data)
        ->excecute();
if ($restBuilder->getResponseInfo()["http_code"] == 201) {
    echo $restBuilder->getResponse();
} else {
    echo "false";
}
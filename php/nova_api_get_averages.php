<?php

require 'base_ajax.php';

use com\novaconcept\utility\RestBuilder;
use DateTime;

$data = $request->getPostData();
$dataArray = json_decode($data->data);

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/account_info/" . $_SESSION['accountInfo'] . "/averages?includes=" . $data->data2)
        ->setHttpMethod(RestBuilder::POST)
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($dataArray)
        ->excecute();
if ($restBuilder->getResponseInfo()["http_code"] == 200) {
    echo $restBuilder->getResponse();
}
    
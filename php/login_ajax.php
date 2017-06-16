<?php

include_once '../com/novaconcept/utility/RestBuilder.php';
include_once '../com/novaconcept/utility/WebConfig.php';

use com\novaconcept\utility\RestBuilder;
use com\novaconcept\utility\WebConfig;

$webConfig = new WebConfig();
$webConfig::setFileLocation("../web_config.json");

$headers = getallheaders();
$authorization = explode(":", base64_decode($headers["Authorization"]), 2);
$postData = new stdClass();
$postData->username = $authorization[0];
$postData->password = $authorization[1];
$restBuilder = new RestBuilder();
$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore . '/' . $webConfig::getEnvironment()->version . "/user_authentication/token")
        ->setHttpMethod(RestBuilder::POST)
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->addQueryParam("includes", "user_authentication,user_authorization_permission,user_permission,account_info,department_info,account_app_settings")
        ->setPostData($postData)
        ->excecute();

session_start();
if ($restBuilder->getResponseInfo()["http_code"] == 201) {
    $response = json_decode($restBuilder->getResponse());
    $_SESSION["token"] = $response->token;
    $_SESSION["userInfo"] = $response->userInfo;
    $_SESSION["userPermission"] = $response->userInfo->userPermission;
    $_SESSION["userAccount"] = $response->userInfo->accountInfo;
    $_SESSION["userAuthorization"] = $response->userInfo->userAuthorizationPermission;
    $_SESSION["accountName"] = '';
    $_SESSION["agency"] = $response->userInfo->departmentInfo[0]->id;
    $_SESSION["group"] = $response->userInfo->departmentInfo[0]->parent;

    if (count($response->userInfo->accountInfo) === 1) {
        $_SESSION["accountInfo"] = $response->userInfo->accountInfo[0]->id;
        $_SESSION["accountName"] = $response->userInfo->accountInfo[0]->name;
        $_SESSION["accountLogo"] = $response->userInfo->accountInfo[0]->settings->logo;
        $_SESSION["accountAside"] = $response->userInfo->accountInfo[0]->settings->colors->aside;
        $_SESSION["accountNav"] = $response->userInfo->accountInfo[0]->settings->colors->nav;
        $_SESSION["accountPrincipal"] = $response->userInfo->accountInfo[0]->settings->colors->principal;
        $_SESSION["accountBtnCancel"] = $response->userInfo->accountInfo[0]->settings->colors->btn_cancel;
        $_SESSION["accountNav2"] = $response->userInfo->accountInfo[0]->settings->colors->nav2;
    }

    if ($response->userInfo->userAuthentication->forceChange !== NULL && $response->userInfo->userAuthentication->forceChange === TRUE) {
        echo 'forceChange';
    } else {
        echo 'true';
    }
} else {
    session_unset();
    session_destroy();
    echo "false";
}
session_write_close();

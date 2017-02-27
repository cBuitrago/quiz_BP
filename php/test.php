<?php

require 'base_ajax.php';

use com\novaconcept\utility\RestBuilder;
use DateTime;
//$data = json_decode(file_get_contents("php://input"));
/*$data = $request->getPostData();*/
$data[] = array(
        "ID" => 2313,
        "QUIZ_ID" => 1,
        "USER_ID" => 1305,
        "START_DATE" => "2017-01-25",
        "END_DATE" => "2017-01-25",
        "PROGRESS_ID" => "3",
        "ANSWERS" => "s0q0a1,s0q1a1,s0q2a2,s1q0a0,s1q1a2,s1q2a2,s2q0a1,s2q1a3,s2q2a1,s3q0a1,s3q1a0,s3q2a0,s4q0a1,s4q1a0,s4q2a3,s5q0a1,s5q1a0,s5q2a0,s6q0a0,s6q1a0,s6q2a2",
        "QUIZ_SCORE" => "s0r-1m6,s1r1m6,s2r1m6,s3r6m6,s4r5m6,s5r1m6,s6r4m6",
        "PREVIOUS_ANSWERS" => null,
        "PREVIOUS_SCORES" => null,
        "QUIZ_NAME" => "QUIZ 01",
        "USER_NAME" => "USER_01",
        "CORPORATE_ID" => "414",
        "CORPORATE_NAME" => "CORPO_TEST_03",
        "GROUP_ID" => 415,
        "GROUP_NAME" => "GROUP_01",
        "AGENCY_ID" => 423,
        "AGENCY_NAME" => "AGENCY_01_G01",
        "PROGRESS_NAME" => "Terminé"
    );
/*$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore.'/'.$webConfig::getEnvironment()->version."/account_info/".$_SESSION['accountInfo']."/report")
        ->setHttpMethod(RestBuilder::GET)
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->excecute();*/

/*$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore.'/'.$webConfig::getEnvironment()->version."/account_info/".$_SESSION['accountInfo']."/allQuiz")
        ->setHttpMethod(RestBuilder::GET)
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($request->getPostData())
        ->excecute();*/

/*$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore.'/'.$webConfig::getEnvironment()->version."/account_info/".$_SESSION['accountInfo']."/quiz")
        ->setHttpMethod(RestBuilder::GET)
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($request->getPostData())
        ->excecute();*/

$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore.'/'.$webConfig::getEnvironment()->version."/account_info/".$_SESSION['accountInfo']."/averages?includes=CORPORATES")
        ->setHttpMethod(RestBuilder::POST)
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($data)
        ->excecute();

/*$restBuilder->setEndpoint($webConfig::getEnvironment()->endpointCore.'/'.$webConfig::getEnvironment()->version."/account_info/".$_SESSION['accountInfo']."/quizResults")
        ->setHttpMethod(RestBuilder::POST)
        ->setKeys($webConfig::getEnvironment()->privateKey, $webConfig::getEnvironment()->publicKey)
        ->setPostData($data)
        ->excecute();*/

print_r($restBuilder->getResponse());
print_r($restBuilder->getResponseInfo());
    
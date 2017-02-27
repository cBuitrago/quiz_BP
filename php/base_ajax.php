<?php

require '../com/novaconcept/utility/RequestUtil.php';
require '../com/novaconcept/utility/RestBuilder.php';
require '../com/novaconcept/utility/WebConfig.php';

use com\novaconcept\utility\RequestUtil;
use com\novaconcept\utility\RestBuilder;
use com\novaconcept\utility\WebConfig;

session_start();

$request = new RequestUtil();
$restBuilder = new RestBuilder();
$webConfig = new WebConfig();
$webConfig::setFileLocation("../web_config.json");

$restBuilder->setToken($_SESSION["token"]);

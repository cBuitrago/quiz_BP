<?php

require_once __DIR__ . '/vendor/autoload.php';

use com\novaconcept\utility\WebConfig;
use com\novaconcept\utility\routing\RoutCollection;

session_start();
date_default_timezone_set("UTC");
WebConfig::setFileLocation("web_config.json");

if (WebConfig::getData()->settings->devMode) {
    error_reporting(-1);
    ini_set('display_errors', 'On');
}
$routCollection = new RoutCollection();
$routCollection->excecute();

<?php

namespace com\novaconcept\utility;

class WebConfig {

    private static $data;

    public static function setFileLocation($fileLocation) {
        self::$data = json_decode(file_get_contents($fileLocation));
        return $this;
    }

    public static function getData() {
        return self::$data;
    }

    public static function getEnvironment() {
        if (self::$data->settings->devMode == TRUE) {
            return self::$data->settings->dev;
        } else {
            return self::$data->settings->prod;
        }
    }

}

<?php

namespace com\novaconcept\utility\routing;

class Rout {

    private $class;
    private $method;
    private $requestMethod;
    private $requestPath;

    public function __construct($requestMethod, $requestPath, $class, $method) {
        $this->requestMethod = $requestMethod;
        $this->requestPath = array();
        foreach ($requestPath as $value) {
            $value = ltrim($value, "/");
            $value = rtrim($value, "/");
            array_push($this->requestPath, explode("/", $value));
        }

        $this->class = $class;
        $this->method = $method;
    }

    public function validatePattern($requestMethod, $pathParams) {
        $limit = count($pathParams);
        if ($limit > count($this->requestPath[0])) {
            $limit = count($this->requestPath[0]);
        }
        for ($i = 0; $i < $limit; $i++) {
            if (strpos($this->requestPath[0][$i], '{') === 0) {
                $pathParams[$i] = $this->requestPath[0][$i];
            }
        }
        $pathParams = implode("/", $pathParams);
        for ($i = 0; $i < count($this->requestPath); $i++) {
            if (implode("/", $this->requestPath[$i]) === $pathParams) {
                return true;
            }
        }
        return false;
    }

    public function getClass() {
        return $this->class;
    }

    public function getMethod() {
        return $this->method;
    }

    public function getRequestPath() {
        return $this->requestPath[0];
    }

}

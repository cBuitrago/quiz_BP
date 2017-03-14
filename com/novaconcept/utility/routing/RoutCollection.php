<?php

namespace com\novaconcept\utility\routing;

use com\novaconcept\utility\WebConfig;
use com\novaconcept\utility\RequestUtil;

class RoutCollection {

    private $host;
    private $hostPath = array();
    private $pageNamespace;
    private $routs = array();

    public function __construct() {
        $this->pageNamespace = WebConfig::getData()->settings->pageNamespace;

        $this->host = WebConfig::getEnvironment()->host;
        $hostPath = WebConfig::getEnvironment()->webPath;
        $hostPath = ltrim($hostPath, "/");
        $hostPath = rtrim($hostPath, "/");
        $this->hostPath = explode("/", $hostPath);

        foreach (WebConfig::getData()->routs as $value) {
            $this->addRout(new Rout($value->requestMethod, $value->requestPath, $value->pageClass, $value->pageMethod));
        }
    }

    public function addRout($rout) {
        array_push($this->routs, $rout);
    }

    public function excecute() {
        $request = new RequestUtil();
        $pathParams = $request->getPathParams();
        $pathParams = array_slice($pathParams, count($this->hostPath));

        foreach ($this->routs as $rout) {
            if ($rout->validatePattern($request->getRequestMethod(), $pathParams)) {
                $newRouth = implode("/", $rout->getRequestPath());
                $request->setPathParamByName($newRouth, $pathParams);
                $class = $this->pageNamespace . $rout->getClass($request);
                $method = $rout->getMethod();
                $instance = new $class($request);
                $instance->$method();
                return;
            }
        }

        http_response_code(400);
    }

}

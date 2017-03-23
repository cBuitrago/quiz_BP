<?php

namespace com\novaconcept\utility;

class RequestUtil {

    private $url;
    private $parsedUrl;
    private $queryParams;
    private $pathParams;
    private $pathParamsOffset;
    private $requestHeaders;
    private $postData;
    private $postFile;
    private $paramsNames;

    public function __construct() {
        $this->url = 'http' . (isset($_SERVER['HTTPS']) ? 's' : '') . '://' . "{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";
        $this->parsedUrl = parse_url($this->url);
        $this->parsePathParams();
        $this->pathParamsOffset = 0;
        $this->parseQueryParams();
        $this->requestHeaders = getallheaders();
    }

    private function parsePathParams() {
        $path = $this->parsedUrl['path'];
        $path = ltrim($path, "/");
        $path = rtrim($path, "/");
        $this->pathParams = explode("/", $path);
    }

    private function parseQueryParams() {
        if (isset($this->parsedUrl["query"]))
            parse_str($this->parsedUrl["query"], $this->queryParams);
    }

    /** @param integer $value */
    public function setPathParamOffset($value) {
        $this->pathParamsOffset = $value;
    }

    /** @return string */
    public function getUrl() {
        return $this->url;
    }

    public function getRequestMethod() {
        return $_SERVER['REQUEST_METHOD'];
    }

    /** @return string */
    public function getScheme() {
        return (isset($this->parsedUrl['scheme]']) ? $this->parsedUrl['scheme]'] : \NULL);
    }

    /** @return string */
    public function getHost() {
        return (isset($this->parsedUrl['host]']) ? $this->parsedUrl['host]'] : \NULL);
    }

    /** @return string */
    public function getUser() {
        return (isset($this->parsedUrl['user]']) ? $this->parsedUrl['user]'] : \NULL);
    }

    /** @return string */
    public function getPass() {
        return (isset($this->parsedUrl['pass]']) ? $this->parsedUrl['pass]'] : \NULL);
    }

    /** @return string */
    public function getPath() {
        return (isset($this->parsedUrl['path]']) ? $this->parsedUrl['path]'] : \NULL);
    }

    /** @return string */
    public function getQuery() {
        return (isset($this->parsedUrl['query]']) ? $this->parsedUrl['query]'] : \NULL);
    }

    /** @return string */
    public function getFragment() {
        return (isset($this->parsedUrl['fragment]']) ? $this->parsedUrl['fragment]'] : \NULL);
    }

    public function getQueryParams() {
        return (isset($this->queryParams) ? $this->queryParams : \NULL);
    }

    public function getQueryParam($name) {
        return (isset($this->queryParams) && isset($this->queryParams[$name]) ? $this->queryParams[$name] : \NULL);
    }

    public function getQueryParamLength() {
        return (isset($this->queryParams) && isset($this->queryParams[$name]) ? count($this->queryParams[$name]) : 0);
    }

    public function getPathParams() {
        return (isset($this->pathParams) ? $this->pathParams : \NULL);
    }

    public function getPathParam($index) {
        return (isset($this->pathParams) && isset($this->pathParams[$index]) ? $this->pathParams[$index] : \NULL);
    }

    public function getPathParamLength() {
        return (isset($this->pathParams) && isset($this->pathParams[$index]) ? count($this->pathParams[$index]) : 0);
    }

    public function getRequestHeaders() {
        return (isset($this->requestHeaders) ? $this->requestHeaders : \NULL);
    }

    public function getRequestHeader($name) {
        return (isset($this->requestHeaders) && isset($this->requestHeaders[$name]) ? $this->requestHeaders[$name] : \NULL);
    }

    public function getPostData() {
        if (!isset($this->postData))
            $this->postData = json_decode(file_get_contents("php://input"));

        return $this->postData;
    }

    public function getPostDataRaw() {
        return file_get_contents("php://input");
    }

    public function getPostFile($fileName = NULL, $extention = NULL) {
        if (strpos($this->getRequestHeader('Content-Type'), 'multipart/form-data') === FALSE)
            return NULL;

        if (strpos($_FILES['userfile']['name'], '.zip') === FALSE)
            return NULL;

        if (!isset($this->postFile)) {
            if ($fileName === NULL)
                $fileName = Formulas::getRandomMd5();
            if ($extention !== NULL)
                $fileName .= $extention;
            $uploadFIle = ApiConfig::getEnvironment()->wwwDataFolder . ApiConfig::getEnvironment()->uploadFolder . '/' . $fileName;
            if (rename($_FILES['upload_file']['tmp_name'], $uploadFIle))
                ; {
                $this->postFile = $uploadFIle;
            }
        }

        return $this->postFile;
    }

    public function setPathParamByName($requestPath, $pathParams) {
        $routNames = explode('/', $requestPath);
        $limit = count($routNames);
        for ($i = 0; $i < $limit; $i++) {
            $name = rtrim($routNames[$i], "}");
            $name = ltrim($name, "{");
            if ( '' != $name){
                $this->paramsNames[$name] = $pathParams[$i];
            }
        }
    }

    public function getPathParamByName($name) {
        if (isset($this->paramsNames[$name]) === TRUE)
            return $this->paramsNames[$name];
    }

}

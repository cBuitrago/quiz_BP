<?php

namespace com\novaconcept\utility;

use CURLFile;

class RestBuilder {

    const GET = "GET";
    const POST = "POST";
    const PUT = "PUT";
    const DELETE = "DELETE";

    private $publicKey;
    private $privateKey;
    private $token;
    private $httpHeaders;
    private $httpMethod;
    private $endpoint;
    private $pathParams;
    private $queryParams;
    private $postData;
    private $response;
    private $responseInfo;

    function __construct() {
        date_default_timezone_set('UTC');
        $this->reset();
    }

    public function reset() {
        unset($this->httpHeaders);
        $this->httpHeaders = [];
        unset($this->httpMethod);
        $this->httpMethod = "GET";
        unset($this->endpoint);
        unset($this->pathParams);
        $this->pathParams = [];
        unset($this->queryParams);
        $this->queryParams = [];
        unset($this->postData);

        unset($this->response);
        unset($this->responseInfo);
        return $this;
    }

    public function setKeys($private, $public) {
        $this->privateKey = $private;
        $this->publicKey = $public;
        return $this;
    }

    public function setToken($value) {
        $this->token = $value;
        return $this;
    }

    public function hasToken() {
        if (isset($this->token) && $this->token !== "")
            return TRUE;
        return FALSE;
    }

    public function setHttpMethod($value) {
        $value = strtoupper($value);
        switch ($value) {
            case "GET":
            case "POST":
            case "PUT":
            case "DELETE":
                $this->httpMethod = $value;
                break;
        }

        return $this;
    }

    public function getHttpMethod() {
        return $this->httpMethod;
    }

    public function setHttpHeaders($value) {
        array_push($this->httpHeaders, $value);
        return $this;
    }

    public function setEndpoint($value) {
        $this->endpoint = rtrim($value, "/ ");
        // return only after first "//"
        return $this;
    }

    public function getEndpoint() {
        return $this->endpoint;
    }

    public function addPathParam($value) {
        array_push($this->pathParams, $value);
        return $this;
    }

    public function removePathParam($index) {
        array_splice($this->pathParams, $index, 1);
    }

    public function getPathParam($index) {
        return $this->pathParams[$index];
    }

    public function getPathParams() {
        return $this->pathParams;
    }

    public function addQueryParam($name, $value) {
        $this->queryParams[$name] = $value;
        return $this;
    }

    public function removeQueryParam($name) {
        unset($arr[$name]);
    }

    public function getQueryParam($name) {
        $this->queryParams[$name];
    }

    public function getQueryParams() {
        $this->queryParams;
    }

    public function setPostData($value) {
        $this->postData = $value;
        return $this;
    }

    public function getPostData() {
        return $this->postData;
    }

    public function excecute($withSSL = FALSE) {
        $uri;
        if ($withSSL === TRUE) {
            $uri = "https://";
        } else {
            $uri = "http://";
        }
        $uri .= $this->endpoint;

        if (count($this->pathParams) > 0) {
            $uri .= "/";
        }
        $uri .= implode("/", $this->pathParams);

        if (count($this->queryParams) > 0) {
            ksort($this->queryParams);
            $uri = $uri . "?";
            foreach ($this->queryParams as $key => $val) {
                $uri .= $key . "=" . $val . "&";
            }
            $uri = rtrim($uri, "&");
        }
        $this->signCall($uri);
        $crl = curl_init($uri);

        curl_setopt($crl, CURLOPT_HTTPHEADER, $this->httpHeaders);
        if ($this->httpMethod === "POST") {
            if (array_search('Content-Type: multipart/form-data', $this->httpHeaders) === FALSE) {
                curl_setopt($crl, CURLOPT_POST, true);
                curl_setopt($crl, CURLOPT_POSTFIELDS, json_encode($this->postData));
            } else {
                $file = realpath($this->postData);
                $cFile = new CURLFile($file, 'application/octet-stream', 'name');
                $post = array('upload_file' => $cFile);
                curl_setopt($crl, CURLOPT_POST, true);
                curl_setopt($crl, CURLOPT_SAFE_UPLOAD, true);
                curl_setopt($crl, CURLOPT_POSTFIELDS, $post);
            }
        } else if ($this->httpMethod === "PUT") {
            curl_setopt($crl, CURLOPT_CUSTOMREQUEST, "PUT");
            curl_setopt($crl, CURLOPT_POSTFIELDS, json_encode($this->postData));
        } else if ($this->httpMethod === "DELETE") {
            curl_setopt($crl, CURLOPT_CUSTOMREQUEST, "DELETE");
            curl_setopt($crl, CURLOPT_POSTFIELDS, json_encode($this->postData));
        }
        curl_setopt($crl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($crl, CURLOPT_FOLLOWLOCATION, true);

        $this->response = curl_exec($crl);
        $this->responseInfo = curl_getinfo($crl);

        curl_close($crl);
    }

    public function getResponse() {
        return $this->response;
    }

    public function getResponseInfo() {
        return $this->responseInfo;
    }

    private function signCall($uri) {
        $nonce = bin2hex(openssl_random_pseudo_bytes(16));
        $signature = md5($uri . time() . $this->privateKey . $nonce);
        $this->httpHeaders[] = 'Content-type: application/json';
        $this->httpHeaders[] = 'Authorization:' .
                $this->publicKey .
                $this->token .
                $signature .
                $nonce;
        $this->httpHeaders[] = 'Date:' . gmdate('D, d M Y H:i:s T');
    }

}
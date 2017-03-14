<?php

namespace com\novaconcept\page;

use com\novaconcept\utility\RequestUtil;
use com\novaconcept\utility\RestBuilder;
use com\novaconcept\utility\WebConfig;
use Smarty;
use stdClass;

class AbstractPage {

    /** @var Smarty */
    private $smarty;

    /** @var RequestUtil */
    protected $request;

    /** @var stdClass */
    protected $data;

    /** @var stdClass */
    protected $view;

    /** @var RestBuilder */
    protected $builder;

    public function __construct($request) {
        header("Cache-Control: no-store, no-cache, must-revalidate");
        $this->request = $request;
        $this->builder = new RestBuilder();
        $this->builder->setKeys(WebConfig::getEnvironment()->privateKey, WebConfig::getEnvironment()->publicKey);

        if (isset($_SESSION["token"])) {
            $this->builder->setToken($_SESSION["token"]);
        }

        if ($this->request->getPathParamByName('accountInfo') !== NULL && (isset($_SESSION["accountInfo"]) && $this->request->getPathParamByName('accountInfo') != $_SESSION["accountInfo"])) {
            $userAccountAuthorization = FALSE;
            foreach ($_SESSION["userAccount"] as $account) {
                if ($account->id == $this->request->getPathParamByName('accountInfo')) {
                    $_SESSION["accountInfo"] = $account->id;
                    $_SESSION["accountName"] = $account->name;
                    $userAccountAuthorization = TRUE;
                    continue;
                }
            }
            if ($userAccountAuthorization === FALSE) {
                $_SESSION["accountInfo"] = '';
                $_SESSION["accountName"] = '';
            }
        }

        $this->smarty = new Smarty();
        $this->data = new stdClass();
        $this->view = new stdClass();

        $smartyDirectory = WebConfig::getEnvironment()->webDirectory . WebConfig::getEnvironment()->webPath . "/com/novaconcept/page/smarty";
        $this->smarty->force_compile = WebConfig::getData()->settings->devMode;
        $this->smarty->setCompileDir($smartyDirectory . "/compile");
    }

    protected function authorize($requiredAuthorization) {

        if (count($_SESSION["userAccount"]) === 1) {
            $userPermissions = $_SESSION["userPermission"];
            $counter = 0;
            foreach ($userPermissions as $userPermission) {
                if ($userPermission->name == "is_god" && $userPermission->isActive) {
                    $this->userAuthorizations();
                    return TRUE;
                }
                $jlimit = count($requiredAuthorization);
                for ($j = 0; $j < $jlimit; $j++) {
                    if ($userPermission->name == $requiredAuthorization[$j] && $userPermission->isActive) {
                        $counter++;
                        break;
                    }
                }
            }
            if ($counter == count($requiredAuthorization)) {
                $this->userAuthorizations();
                return TRUE;
            }
        } else {
            $userAuthorizations = $_SESSION["userAuthorization"];
            $counter = 0;
            foreach ($userAuthorizations as $userAuthorization) {
                if ($userAuthorization->permissionName == "is_god" && $userAuthorization->permissionIsActive && $userAuthorization->accountInfo == $_SESSION['accountInfo']) {
                    $this->userAuthorizations();
                    return TRUE;
                }
                $jlimit = count($requiredAuthorization);
                for ($j = 0; $j < $jlimit; $j++) {
                    if ($userAuthorization->permissionName == $requiredAuthorization[$j] && $userAuthorization->permissionIsActive && $userAuthorization->accountInfo == $_SESSION['accountInfo']) {
                        $counter++;
                        break;
                    }
                }
            }
            if ($counter == count($requiredAuthorization)) {
                $this->userAuthorizations();
                return TRUE;
            }
        }
        return FALSE;
    }

    protected function display($template) {
        /* if (isset($_POST["lang"]) && !empty($_POST["lang"]))
          {
          $lang = $_POST["lang"];
          $_SESSION['lang'] = $_POST["lang"];
          }
          if (!isset($lang))
          {
          $lang = (isset($_SESSION['lang']) && !empty($_SESSION['lang']))? $_SESSION['lang'] : substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
          }
          if (!file_exists("data/localization/".$lang.".json"))
          {
          $lang = WebConfig::getData()->settings->defaultLanguage;
          } */
        $lang = 'fr';
        $lang = json_decode(file_get_contents("data/localization/" . $lang . ".json"));
        $lang->dateFormat = "F j, Y, g:i a";
        $head = new stdClass();
        $head->baseUrl = "http://" . WebConfig::getEnvironment()->host . WebConfig::getEnvironment()->webPath;
        $head->host = "http://" . WebConfig::getEnvironment()->host;
        $this->smarty->assign("lang", $lang);
        $this->smarty->assign("head", $head);
        $this->smarty->assign("view", $this->view);
        $this->smarty->assign("data", $this->data);
        $this->smarty->display("com/novaconcept/page/smarty/" . $template);
    }

    protected function userAuthorizations() {
        foreach ($_SESSION["userAuthorization"] as $authorization) {
            if ($authorization->accountInfo == $_SESSION['accountInfo']) {
                switch ($authorization->permissionName) {
                    case 'is_god':
                        $this->view->manage_users = TRUE;
                        $this->view->manage_permissions = TRUE;
                        $this->view->manage_accounts = TRUE;
                        $this->view->manage_departments = TRUE;
                        $this->view->manage_clients = TRUE;
                        $this->view->manage = TRUE;
                        $this->view->manage_account_config = TRUE;
                        $this->view->manage_account_billing = TRUE;
                        $this->view->manage_modules = TRUE;
                        $this->view->manage_contents = TRUE;
                        $this->view->manage_app_settings = TRUE;
                        $this->view->is_corpo_admin = TRUE;
                        $this->view->is_group_admin = TRUE;
                        $this->view->is_agency_admin = TRUE;
                        $this->view->is_user = TRUE;
                        break;
                    case 'can_manage_users':
                        $this->view->manage_users = TRUE;
                        break;
                    case 'can_manage_permissions':
                        $this->view->manage_permissions = TRUE;
                        break;
                    case 'can_manage_account':
                        $this->view->manage_accounts = TRUE;
                        break;
                    case 'can_manage_departments':
                        $this->view->manage_departments = TRUE;
                        break;
                    case 'can_manage_clients':
                        $this->view->manage_clients = TRUE;
                        break;
                    case 'can_manage':
                        $this->view->manage = TRUE;
                        break;
                    case 'can_manage_account_config':
                        $this->view->manage_account_config = TRUE;
                        break;
                    case 'can_manage_account_billing':
                        $this->view->manage_account_billing = TRUE;
                        break;
                    case 'can_manage_modules':
                        $this->view->manage_modules = TRUE;
                        break;
                    case 'can_manage_content':
                        $this->view->manage_contents = TRUE;
                        break;
                    case 'can_manage_app_settings':
                        $this->view->manage_app_settings = TRUE;
                        break;
                    case 'is_corpo_admin':
                        $this->view->is_corpo_admin = TRUE;
                        break;
                    case 'is_group_admin':
                        $this->view->is_group_admin = TRUE;
                        break;
                    case 'is_agency_admin':
                        $this->view->is_agency_admin = TRUE;
                        break;
                    case 'is_user':
                        $this->view->is_user = TRUE;
                        break;
                    default:
                        break;
                }
            }
        }
    }

}

<?php /* Smarty version 3.1.27, created on 2017-06-14 17:37:34
         compiled from "/var/www/html/quiz_panel/com/novaconcept/page/smarty/LoginPageNova.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:7170741045941745ecd4ae8_04495378%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '468fd12dd504cd139003263b178e9f4dc6a29804' => 
    array (
      0 => '/var/www/html/quiz_panel/com/novaconcept/page/smarty/LoginPageNova.tpl',
      1 => 1490712091,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '7170741045941745ecd4ae8_04495378',
  'variables' => 
  array (
    'lang' => 0,
    'head' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_5941745ed40e90_02504536',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_5941745ed40e90_02504536')) {
function content_5941745ed40e90_02504536 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '7170741045941745ecd4ae8_04495378';
?>
<html>
    <?php echo $_smarty_tpl->getSubTemplate ("com/novaconcept/page/smarty/includes/HeadTag.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('lang'=>$_smarty_tpl->tpl_vars['lang']->value,'head'=>$_smarty_tpl->tpl_vars['head']->value), 0);
?>

    <body class="login">
        <nav>
            <div class="image">
                <img src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/media/images/logoCompany_Nova.png">
            </div>
            <div class="text-login">
                <h1></h1>
            </div>
        </nav>
        <article class="content-login">
            <h1 style='color: #ffffff'>Nova Quiz App</h1>
        </article
    </body>
</html><?php }
}
?>
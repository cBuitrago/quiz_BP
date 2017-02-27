<?php /* Smarty version 3.1.27, created on 2017-02-27 14:40:37
         compiled from "/var/www/html/quiz_panel/com/novaconcept/page/smarty/includes/NavTag.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:22705275058b43a653cd553_93988858%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '48841972b194c42b692c3972daf6887a0593c22b' => 
    array (
      0 => '/var/www/html/quiz_panel/com/novaconcept/page/smarty/includes/NavTag.tpl',
      1 => 1487271462,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '22705275058b43a653cd553_93988858',
  'variables' => 
  array (
    'head' => 0,
    'lang' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_58b43a653d4a24_45481783',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_58b43a653d4a24_45481783')) {
function content_58b43a653d4a24_45481783 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '22705275058b43a653cd553_93988858';
?>
<nav class="head">
    <div class="image">
        <img src="/quiz_panel/media/images/logo-cfc-fr.jpeg">
    </div>
    <div class="dropdown">
        <button class="dropdown-toggle" type="button" id="profile-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
            <?php echo $_SESSION['userInfo']->firstName;?>
 <?php echo $_SESSION['userInfo']->name;?>

            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" aria-labelledby="profile-dropdown">
            <li><a href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/profile">Profile</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/logout"><?php echo $_smarty_tpl->tpl_vars['lang']->value->includes->logOut;?>
</a></li>
        </ul>
    </div>
</nav><?php }
}
?>
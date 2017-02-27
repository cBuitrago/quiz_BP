<?php /* Smarty version 3.1.27, created on 2017-02-27 14:40:37
         compiled from "/var/www/html/quiz_panel/com/novaconcept/page/smarty/user_panel/EditProfile.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:74596392158b43a6535b7e4_50212962%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'ed615f3852fa82bf958563b444e5c6c542dbe192' => 
    array (
      0 => '/var/www/html/quiz_panel/com/novaconcept/page/smarty/user_panel/EditProfile.tpl',
      1 => 1487273717,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '74596392158b43a6535b7e4_50212962',
  'variables' => 
  array (
    'lang' => 0,
    'head' => 0,
    'view' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_58b43a653b49b5_54219992',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_58b43a653b49b5_54219992')) {
function content_58b43a653b49b5_54219992 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '74596392158b43a6535b7e4_50212962';
?>
<html><?php echo $_smarty_tpl->getSubTemplate ("com/novaconcept/page/smarty/includes/HeadTag.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('lang'=>$_smarty_tpl->tpl_vars['lang']->value,'head'=>$_smarty_tpl->tpl_vars['head']->value,'view'=>$_smarty_tpl->tpl_vars['view']->value), 0);
?>
<body><?php echo $_smarty_tpl->getSubTemplate ("com/novaconcept/page/smarty/includes/NavTag.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('lang'=>$_smarty_tpl->tpl_vars['lang']->value,'head'=>$_smarty_tpl->tpl_vars['head']->value,'view'=>$_smarty_tpl->tpl_vars['view']->value), 0);
?>
<article class="container"><article class="aside"><?php echo $_smarty_tpl->getSubTemplate ("com/novaconcept/page/smarty/includes/Aside.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('lang'=>$_smarty_tpl->tpl_vars['lang']->value,'head'=>$_smarty_tpl->tpl_vars['head']->value,'view'=>$_smarty_tpl->tpl_vars['view']->value), 0);
?>
</article><article class="center"><h1><?php echo $_smarty_tpl->tpl_vars['lang']->value->user->profile;?>
</h1><form id="edit_user_profile_form"><table><tr><td><label for="firstName"><?php echo $_smarty_tpl->tpl_vars['lang']->value->user->firstName;?>
</label></td><td><input type="text" name="firstName" id="firstName" value="<?php echo $_SESSION['userInfo']->firstName;?>
" ></td></tr><tr><td><label for="name"><?php echo $_smarty_tpl->tpl_vars['lang']->value->user->name;?>
</label></td><td><input type="text" name="name" id="name" value="<?php echo $_SESSION['userInfo']->name;?>
" ></td></tr><tr><td><label for="username"><?php echo $_smarty_tpl->tpl_vars['lang']->value->user->username;?>
</label></td><td><input type="text" name="username" id="username" value="<?php echo $_SESSION['userInfo']->username;?>
" ></td></tr></table><button type="button" class="save" id="onUserEditProfile"><?php echo $_smarty_tpl->tpl_vars['lang']->value->user->edit;?>
</button></form><form id="edit_user_password_form"><table><tr><td><label for="psw"><?php echo $_smarty_tpl->tpl_vars['lang']->value->user->newPsw;?>
</label></td><td><input type="password" name="psw" id="psw" ></td></tr><tr><td><label for="psw1"><?php echo $_smarty_tpl->tpl_vars['lang']->value->user->newPswVerification;?>
</label></td><td><input type="password" name="psw1" id="psw1" ></td></tr></table><button type="button" class="save" id="onUserEditPassword"><?php echo $_smarty_tpl->tpl_vars['lang']->value->user->change;?>
</button></form></article></article><footer><div class="footer"><p><?php echo $_smarty_tpl->tpl_vars['lang']->value->includes->footer;?>
</p></div></footer></body></html><?php }
}
?>
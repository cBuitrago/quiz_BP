<?php /* Smarty version 3.1.27, created on 2017-02-27 14:40:31
         compiled from "/var/www/html/quiz_panel/com/novaconcept/page/smarty/includes/General.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:43065646158b43a5f169761_52274424%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '1b3bcf440e03525a121492d1553005bdee7f0725' => 
    array (
      0 => '/var/www/html/quiz_panel/com/novaconcept/page/smarty/includes/General.tpl',
      1 => 1487269527,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '43065646158b43a5f169761_52274424',
  'variables' => 
  array (
    'lang' => 0,
    'head' => 0,
    'view' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_58b43a5f171989_68919013',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_58b43a5f171989_68919013')) {
function content_58b43a5f171989_68919013 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '43065646158b43a5f169761_52274424';
?>
<html><?php echo $_smarty_tpl->getSubTemplate ("com/novaconcept/page/smarty/includes/HeadTag.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('lang'=>$_smarty_tpl->tpl_vars['lang']->value,'head'=>$_smarty_tpl->tpl_vars['head']->value,'view'=>$_smarty_tpl->tpl_vars['view']->value), 0);
?>
<body><?php echo $_smarty_tpl->getSubTemplate ("com/novaconcept/page/smarty/includes/NavTag.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('lang'=>$_smarty_tpl->tpl_vars['lang']->value,'head'=>$_smarty_tpl->tpl_vars['head']->value,'view'=>$_smarty_tpl->tpl_vars['view']->value), 0);
?>
<article class="container"><article class="aside"><?php echo $_smarty_tpl->getSubTemplate ("com/novaconcept/page/smarty/includes/Aside.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('lang'=>$_smarty_tpl->tpl_vars['lang']->value,'head'=>$_smarty_tpl->tpl_vars['head']->value,'view'=>$_smarty_tpl->tpl_vars['view']->value), 0);
?>
</article><article class="center"><?php echo $_smarty_tpl->getSubTemplate ($_smarty_tpl->tpl_vars['view']->value->center, $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('lang'=>$_smarty_tpl->tpl_vars['lang']->value,'head'=>$_smarty_tpl->tpl_vars['head']->value,'view'=>$_smarty_tpl->tpl_vars['view']->value), 0);
?>
</article></article><footer><div class="footer"><p><?php echo $_smarty_tpl->tpl_vars['lang']->value->includes->footer;?>
</p></div></footer><div class="modal" id="msgModal" tabindex="-1" role="dialog"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span class="icon-remove" aria-hidden="true"></span></button></div><div class="modal-body"><h1 id="errorMsg"></h1></div></div></div></div></body></html><?php }
}
?>
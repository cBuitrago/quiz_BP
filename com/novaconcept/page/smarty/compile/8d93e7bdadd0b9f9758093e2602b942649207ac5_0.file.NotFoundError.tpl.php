<?php /* Smarty version 3.1.27, created on 2017-05-11 18:52:03
         compiled from "/var/www/html/quiz_panel/com/novaconcept/page/smarty/error/NotFoundError.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:20759280975914b2d32dbd75_66767839%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8d93e7bdadd0b9f9758093e2602b942649207ac5' => 
    array (
      0 => '/var/www/html/quiz_panel/com/novaconcept/page/smarty/error/NotFoundError.tpl',
      1 => 1485875854,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '20759280975914b2d32dbd75_66767839',
  'variables' => 
  array (
    'lang' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_5914b2d32de489_91131759',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_5914b2d32de489_91131759')) {
function content_5914b2d32de489_91131759 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '20759280975914b2d32dbd75_66767839';
?>
<h1><?php echo $_smarty_tpl->tpl_vars['lang']->value->includes->error404;?>
</h1>
<a class="addChild" href="<?php echo $_SERVER['HTTP_REFERER'];?>
">back</a><?php }
}
?>
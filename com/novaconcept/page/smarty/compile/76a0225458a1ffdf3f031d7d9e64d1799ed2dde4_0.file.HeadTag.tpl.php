<?php /* Smarty version 3.1.27, created on 2017-02-27 14:40:37
         compiled from "/var/www/html/quiz_panel/com/novaconcept/page/smarty/includes/HeadTag.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:201170037758b43a653ba4b6_60955804%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '76a0225458a1ffdf3f031d7d9e64d1799ed2dde4' => 
    array (
      0 => '/var/www/html/quiz_panel/com/novaconcept/page/smarty/includes/HeadTag.tpl',
      1 => 1487696235,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '201170037758b43a653ba4b6_60955804',
  'variables' => 
  array (
    'view' => 0,
    'head' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_58b43a653c7ef9_15460973',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_58b43a653c7ef9_15460973')) {
function content_58b43a653c7ef9_15460973 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '201170037758b43a653ba4b6_60955804';
?>
<head>
    <title><?php echo $_smarty_tpl->tpl_vars['view']->value->title;?>
</title>
    <meta charset="UTF-8">
    <link href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/libs/twitter-bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Roboto:300,400' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/css/main.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.css"/>
    <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/libs/jquery/jquery.js" type="text/javascript"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/libs/twitter-bootstrap/js/bootstrap.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/main.js" type="text/javascript"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 type="text/javascript"> baseUrl = "<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
";<?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 type="text/javascript">var account = <?php if (isset($_SESSION['accountInfo'])) {
echo $_SESSION['accountInfo'];
} else { ?>0<?php }?><?php echo '</script'; ?>
>
</head><?php }
}
?>
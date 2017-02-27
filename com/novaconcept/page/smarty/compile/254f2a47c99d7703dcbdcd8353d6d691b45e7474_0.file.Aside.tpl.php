<?php /* Smarty version 3.1.27, created on 2017-02-27 14:40:37
         compiled from "/var/www/html/quiz_panel/com/novaconcept/page/smarty/includes/Aside.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:163276075758b43a653da540_54136429%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '254f2a47c99d7703dcbdcd8353d6d691b45e7474' => 
    array (
      0 => '/var/www/html/quiz_panel/com/novaconcept/page/smarty/includes/Aside.tpl',
      1 => 1487969272,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '163276075758b43a653da540_54136429',
  'variables' => 
  array (
    'view' => 0,
    'head' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_58b43a653fc450_50919386',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_58b43a653fc450_50919386')) {
function content_58b43a653fc450_50919386 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '163276075758b43a653da540_54136429';
?>
<ul>
    <?php if ((isset($_smarty_tpl->tpl_vars['view']->value->is_agency_admin) && $_smarty_tpl->tpl_vars['view']->value->is_agency_admin === TRUE) || (isset($_smarty_tpl->tpl_vars['view']->value->is_group_admin) && $_smarty_tpl->tpl_vars['view']->value->is_group_admin === TRUE) || (isset($_smarty_tpl->tpl_vars['view']->value->is_corpo_admin) && $_smarty_tpl->tpl_vars['view']->value->is_corpo_admin === TRUE)) {?>
    <li>
        <a href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/<?php echo $_SESSION['accountInfo'];?>
/user">
            <span class="glyphicon glyphicon-user"></span><br>UTILISATEURS
        </a>
    </li>
    <?php }?>
    <?php if ((isset($_smarty_tpl->tpl_vars['view']->value->is_corpo_admin) && $_smarty_tpl->tpl_vars['view']->value->is_corpo_admin === TRUE)) {?>
    <li>
        <a href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/<?php echo $_SESSION['accountInfo'];?>
/corpo">
            <span class="glyphicon glyphicon-globe"></span><br>CORPO
        </a>
    </li>
    <?php }?>
    <?php if ((isset($_smarty_tpl->tpl_vars['view']->value->is_group_admin) && $_smarty_tpl->tpl_vars['view']->value->is_group_admin === TRUE) || (isset($_smarty_tpl->tpl_vars['view']->value->is_corpo_admin) && $_smarty_tpl->tpl_vars['view']->value->is_corpo_admin === TRUE)) {?>
    <li>
        <a href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/<?php echo $_SESSION['accountInfo'];?>
/group/<?php echo $_SESSION['group'];?>
">
            <span class="glyphicon glyphicon-user"></span><br>GROUPE
        </a>
    </li>
    <?php }?>
    <?php if ((isset($_smarty_tpl->tpl_vars['view']->value->is_agency_admin) && $_smarty_tpl->tpl_vars['view']->value->is_agency_admin === TRUE) || (isset($_smarty_tpl->tpl_vars['view']->value->is_group_admin) && $_smarty_tpl->tpl_vars['view']->value->is_group_admin === TRUE) || (isset($_smarty_tpl->tpl_vars['view']->value->is_corpo_admin) && $_smarty_tpl->tpl_vars['view']->value->is_corpo_admin === TRUE)) {?>
    <li>
        <a href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/<?php echo $_SESSION['accountInfo'];?>
/agency/<?php echo $_SESSION['agency'];?>
">
            <span class="glyphicon glyphicon-edit"></span><br>AGENCE
        </a>
    </li>
    <?php }?>
    <?php if ((isset($_smarty_tpl->tpl_vars['view']->value->is_agency_admin) && $_smarty_tpl->tpl_vars['view']->value->is_agency_admin === TRUE) || (isset($_smarty_tpl->tpl_vars['view']->value->is_group_admin) && $_smarty_tpl->tpl_vars['view']->value->is_group_admin === TRUE) || (isset($_smarty_tpl->tpl_vars['view']->value->is_corpo_admin) && $_smarty_tpl->tpl_vars['view']->value->is_corpo_admin === TRUE) || (isset($_smarty_tpl->tpl_vars['view']->value->is_user) && $_smarty_tpl->tpl_vars['view']->value->is_user === TRUE)) {?>
    <li>
        <a href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/<?php echo $_SESSION['accountInfo'];?>
/quiz">
            <span class="glyphicon glyphicon-user"></span><br>QUIZ
        </a>
    </li>
    <?php }?>
    <?php if ((isset($_smarty_tpl->tpl_vars['view']->value->is_agency_admin) && $_smarty_tpl->tpl_vars['view']->value->is_agency_admin === TRUE) || (isset($_smarty_tpl->tpl_vars['view']->value->is_group_admin) && $_smarty_tpl->tpl_vars['view']->value->is_group_admin === TRUE) || (isset($_smarty_tpl->tpl_vars['view']->value->is_corpo_admin) && $_smarty_tpl->tpl_vars['view']->value->is_corpo_admin === TRUE)) {?>
    <li>
        <a href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/<?php echo $_SESSION['accountInfo'];?>
/report">
            <span class="glyphicon glyphicon-user"></span><br>REPORTS
        </a>
    </li>
    <?php }?>
</ul><?php }
}
?>
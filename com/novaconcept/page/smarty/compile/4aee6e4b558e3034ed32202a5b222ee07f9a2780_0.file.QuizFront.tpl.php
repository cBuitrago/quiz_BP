<?php /* Smarty version 3.1.27, created on 2017-02-27 14:40:31
         compiled from "/var/www/html/quiz_panel/com/novaconcept/page/smarty/quiz_panel/QuizFront.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:103911971558b43a5f1ae8b3_15219392%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '4aee6e4b558e3034ed32202a5b222ee07f9a2780' => 
    array (
      0 => '/var/www/html/quiz_panel/com/novaconcept/page/smarty/quiz_panel/QuizFront.tpl',
      1 => 1487623391,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '103911971558b43a5f1ae8b3_15219392',
  'variables' => 
  array (
    'view' => 0,
    'head' => 0,
    'data' => 0,
    'id' => 0,
    'quiz' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_58b43a5f27b274_21581685',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_58b43a5f27b274_21581685')) {
function content_58b43a5f27b274_21581685 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '103911971558b43a5f1ae8b3_15219392';
if ((isset($_smarty_tpl->tpl_vars['view']->value->is_corpo_admin) && $_smarty_tpl->tpl_vars['view']->value->is_corpo_admin === TRUE)) {?>
    <table>
        <tr>
            <td>
                <h1>Ajouter Quiz</h1>
            </td>
            <td>
                <a class="edit" href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/<?php echo $_SESSION['accountInfo'];?>
/add/quiz"
                   data-toggle="tooltip" data-placement="left" title="info de l'utilisateur">
                    <span class="glyphicon glyphicon-plus"></span>
                </a>
            </td>
        </tr>
    </table>
<?php }?>

<?php if ((isset($_smarty_tpl->tpl_vars['view']->value->is_agency_admin) && $_smarty_tpl->tpl_vars['view']->value->is_agency_admin === TRUE) || (isset($_smarty_tpl->tpl_vars['view']->value->is_group_admin) && $_smarty_tpl->tpl_vars['view']->value->is_group_admin === TRUE) || (isset($_smarty_tpl->tpl_vars['view']->value->is_corpo_admin) && $_smarty_tpl->tpl_vars['view']->value->is_corpo_admin === TRUE) || (isset($_smarty_tpl->tpl_vars['view']->value->is_user) && $_smarty_tpl->tpl_vars['view']->value->is_user === TRUE)) {?>
<h1>Quiz List</h1>

<table class="table table-striped">
    <tr>
        <td>
            #
        </td>
        <td>
            Quiz
        </td>
        <td>
            Go!
        </td>
        <td>
            Résultats
        </td>
    </tr>
    <?php $_smarty_tpl->tpl_vars["id"] = new Smarty_Variable(0, null, 0);?>
    <?php
$_from = $_smarty_tpl->tpl_vars['data']->value;
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$_smarty_tpl->tpl_vars['quiz'] = new Smarty_Variable;
$_smarty_tpl->tpl_vars['quiz']->_loop = false;
foreach ($_from as $_smarty_tpl->tpl_vars['quiz']->value) {
$_smarty_tpl->tpl_vars['quiz']->_loop = true;
$foreach_quiz_Sav = $_smarty_tpl->tpl_vars['quiz'];
?>
        <?php $_smarty_tpl->tpl_vars["id"] = new Smarty_Variable($_smarty_tpl->tpl_vars['id']->value+1, null, 0);?>
        <tr>
            <td>
                <?php echo $_smarty_tpl->tpl_vars['id']->value;?>

            </td>
            <td><?php echo $_smarty_tpl->tpl_vars['quiz']->value->QUIZ_ID;?>
</td>
            <td>
                <a class="edit" href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/<?php echo $_SESSION['accountInfo'];?>
/quiz/<?php echo $_smarty_tpl->tpl_vars['quiz']->value->ID;?>
"
                   data-toggle="tooltip" data-placement="left" title="info de l'utilisateur">
                    <span class="glyphicon glyphicon-pencil"></span>
                </a>
            </td>
            <td>
                <?php if ($_smarty_tpl->tpl_vars['quiz']->value->IS_USER_CAN_DISPLAY_QA) {?>
                    <a class="edit" href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/<?php echo $_SESSION['accountInfo'];?>
/quiz/<?php echo $_smarty_tpl->tpl_vars['quiz']->value->ID;?>
"
                       data-toggle="tooltip" data-placement="left" title="info de l'utilisateur">
                        <span class="glyphicon glyphicon-pencil"></span>
                    </a>
                <?php }?>
            </td>
        </tr>
    <?php
$_smarty_tpl->tpl_vars['quiz'] = $foreach_quiz_Sav;
}
?>
</table>
<?php }
}
}
?>
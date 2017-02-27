<?php /* Smarty version 3.1.27, created on 2017-02-27 14:40:26
         compiled from "/var/www/html/quiz_panel/com/novaconcept/page/smarty/department_panel/Groups.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:41362944358b43a5aa66ae9_94230006%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '22ad10b54c6f3edeef2da36b071d76244175b4ca' => 
    array (
      0 => '/var/www/html/quiz_panel/com/novaconcept/page/smarty/department_panel/Groups.tpl',
      1 => 1487971841,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '41362944358b43a5aa66ae9_94230006',
  'variables' => 
  array (
    'data' => 0,
    'lang' => 0,
    'group' => 0,
    'head' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_58b43a5aaf8ed6_47859025',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_58b43a5aaf8ed6_47859025')) {
function content_58b43a5aaf8ed6_47859025 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '41362944358b43a5aa66ae9_94230006';
?>
<div>
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#infoCorpo" aria-controls="home" role="tab" data-toggle="tab">CORPO INFO</a></li>
        <li role="presentation"><a href="#manageGroups" aria-controls="profile" role="tab" data-toggle="tab">GESTION DE GROUPS</a></li>
    </ul>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="infoCorpo">
            <h1><?php echo $_smarty_tpl->tpl_vars['data']->value->corpo->name;?>
</h1>
            <h2>Editer Corpo</h2>
            <form id="edit_department_form" method="post">
                <table>
                    <input type="hidden" name="id" id="id" value="<?php echo $_smarty_tpl->tpl_vars['data']->value->corpo->id;?>
">
                    <input type="hidden" name="description" id="description" value="IS_CORPO">
                    <input type="hidden" name="parent" id="parent" value="<?php echo $_smarty_tpl->tpl_vars['data']->value->corpo->parent;?>
">
                    <tr>
                        <td>
                            <label for="name">Nom du Corpo</label>
                        </td>
                        <td>
                            <input type="text" name="name" id="name" value="<?php echo $_smarty_tpl->tpl_vars['data']->value->corpo->name;?>
">
                        </td>
                        <td>
                            <button type="button" class="edit" id="onDepartmentEdit" data-toggle="tooltip" data-placement="left" title="Editer le nom de la corporation"><span class="glyphicon glyphicon-pencil"></span></button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div role="tabpanel" class="tab-pane" id="manageGroups">
            <h2>Ajouter Groupe</h2>
            <form id="add_department_form" method="post">
                <table>
                    <input type="hidden" name="description" id="description" value="IS_GROUP">
                    <input type="hidden" name="parent" id="parent" value="<?php echo $_smarty_tpl->tpl_vars['data']->value->corpo->id;?>
">
                    <tr>
                        <td>
                            <label for="name"><?php echo $_smarty_tpl->tpl_vars['lang']->value->department->name;?>
</label>
                        </td>
                        <td>
                            <input type="text" name="name" id="name">
                        </td>
                        <td>
                            <button type="button" class="edit" id="onDepartmentAdd" data-toggle="tooltip" data-placement="left" title="ajouter groupe">
                                <span class="glyphicon glyphicon-plus">
                            </button>
                        </td>
                    </tr>
                </table>
            </form>
            <h2>Groupes</h2>
            <ul>
                <?php
$_from = $_smarty_tpl->tpl_vars['data']->value->groups;
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$_smarty_tpl->tpl_vars['group'] = new Smarty_Variable;
$_smarty_tpl->tpl_vars['group']->_loop = false;
foreach ($_from as $_smarty_tpl->tpl_vars['group']->value) {
$_smarty_tpl->tpl_vars['group']->_loop = true;
$foreach_group_Sav = $_smarty_tpl->tpl_vars['group'];
?>
                    <ul class="tree">
                        <li class="department"><?php echo $_smarty_tpl->tpl_vars['group']->value->name;?>
</li>
                        <li><a class="edit" href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/<?php echo $_SESSION['accountInfo'];?>
/group/<?php echo $_smarty_tpl->tpl_vars['group']->value->id;?>
" data-toggle="tooltip" data-placement="left" title="info du groupe"><span class="glyphicon glyphicon-pencil"></span></a>
                    </ul>  
                <?php
$_smarty_tpl->tpl_vars['group'] = $foreach_group_Sav;
}
?>
            </ul>
        </div>
    </div>
</div>









<?php }
}
?>
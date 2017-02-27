<?php /* Smarty version 3.1.27, created on 2017-02-27 14:40:29
         compiled from "/var/www/html/quiz_panel/com/novaconcept/page/smarty/department_panel/Agency.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:63273809358b43a5de77bc9_67250248%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f17d98718560c734f0c7a775f6088054c74fe8eb' => 
    array (
      0 => '/var/www/html/quiz_panel/com/novaconcept/page/smarty/department_panel/Agency.tpl',
      1 => 1487972209,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '63273809358b43a5de77bc9_67250248',
  'variables' => 
  array (
    'data' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_58b43a5deadd44_77997650',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_58b43a5deadd44_77997650')) {
function content_58b43a5deadd44_77997650 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '63273809358b43a5de77bc9_67250248';
?>
<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#infoAgency" aria-controls="home" role="tab" data-toggle="tab">AGENCE INFO</a></li>
    <li role="presentation"><a href="#manageUsers" aria-controls="profile" role="tab" data-toggle="tab">GESTION D'UTILISATEURS</a></li>
</ul>
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="infoAgency">
        <h1><?php echo $_smarty_tpl->tpl_vars['data']->value->agency->name;?>
</h1>
        <h2>Editer Agence</h2>
        <form id="edit_department_form" method="post">
            <table>
                <input type="hidden" name="id" id="id" value="<?php echo $_smarty_tpl->tpl_vars['data']->value->agency->id;?>
">
                <input type="hidden" name="description" id="description" value="IS_AGENCY">
                <input type="hidden" name="parent" id="parent" value="<?php echo $_smarty_tpl->tpl_vars['data']->value->group->id;?>
">
                <tr>
                    <td>
                        <label for="name">Nom de l'agence</label>
                    </td>
                    <td>
                        <input type="text" name="name" id="name" value="<?php echo $_smarty_tpl->tpl_vars['data']->value->agency->name;?>
">
                    </td>
                    <td>
                        <button type="button" class="edit" id="onDepartmentEdit"
                                data-toggle="tooltip" data-placement="left" title="editer agence">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div role="tabpanel" class="tab-pane active" id="manageUsers">
        <h2>Utilisateurs</h2>
        <table id="dataTableAgency" class="display" cellspacing="0" width="100%"></table>
    </div>
</div><?php }
}
?>
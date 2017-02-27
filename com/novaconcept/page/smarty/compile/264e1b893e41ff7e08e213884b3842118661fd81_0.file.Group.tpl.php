<?php /* Smarty version 3.1.27, created on 2017-02-27 14:40:28
         compiled from "/var/www/html/quiz_panel/com/novaconcept/page/smarty/department_panel/Group.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:37469101858b43a5c4bc285_69681103%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '264e1b893e41ff7e08e213884b3842118661fd81' => 
    array (
      0 => '/var/www/html/quiz_panel/com/novaconcept/page/smarty/department_panel/Group.tpl',
      1 => 1487971998,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '37469101858b43a5c4bc285_69681103',
  'variables' => 
  array (
    'data' => 0,
    'agence' => 0,
    'head' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_58b43a5c5194b2_92483929',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_58b43a5c5194b2_92483929')) {
function content_58b43a5c5194b2_92483929 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '37469101858b43a5c4bc285_69681103';
?>
<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#infoGroup" aria-controls="home" role="tab" data-toggle="tab">GROUPE INFO</a></li>
    <li role="presentation"><a href="#manageAgences" aria-controls="profile" role="tab" data-toggle="tab">GESTION DE AGENCES</a></li>
</ul>
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="infoGroup">
        <h1><?php echo $_smarty_tpl->tpl_vars['data']->value->group->name;?>
</h1>
        <h2>Editer Group</h2>
        <form id="edit_department_form" method="post">
            <table>
                <input type="hidden" name="id" id="id" value="<?php echo $_smarty_tpl->tpl_vars['data']->value->group->id;?>
">
                <input type="hidden" name="description" id="description" value="IS_GROUP">
                <input type="hidden" name="parent" id="parent" value="<?php echo $_smarty_tpl->tpl_vars['data']->value->group->parent;?>
">
                <tr>
                    <td>
                        <label for="name">Nom du groupe</label>
                    </td>
                    <td>
                        <input type="text" name="name" id="name" value="<?php echo $_smarty_tpl->tpl_vars['data']->value->group->name;?>
">
                    </td>
                    <td>
                        <button type="button" class="edit" id="onDepartmentEdit" 
                                data-toggle="tooltip" data-placement="left" title="editer le nom du group">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div role="tabpanel" class="tab-pane active" id="manageAgences">
        <h2>Ajouter Agence</h2>
        <form id="add_department_form" method="post">
            <table>
                <input type="hidden" name="description" id="description" value="IS_AGENCY">
                <input type="hidden" name="parent" id="parent" value="<?php echo $_smarty_tpl->tpl_vars['data']->value->group->id;?>
">
                <tr>
                    <td>
                        <label for="name">Nom de l'agence</label>
                    </td>
                    <td>
                        <input type="text" name="name" id="name">
                    </td>
                    <td>
                        <button type="button" class="edit" id="onDepartmentAdd" 
                                data-toggle="tooltip" data-placement="left" title="ajouter une agence">
                            <span class="glyphicon glyphicon-plus"></span>
                        </button>
                    </td>
                </tr>
            </table>

        </form>
        <h2>Agencies</h2>
        <ul>
            <?php
$_from = $_smarty_tpl->tpl_vars['data']->value->agency;
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$_smarty_tpl->tpl_vars['agence'] = new Smarty_Variable;
$_smarty_tpl->tpl_vars['agence']->_loop = false;
foreach ($_from as $_smarty_tpl->tpl_vars['agence']->value) {
$_smarty_tpl->tpl_vars['agence']->_loop = true;
$foreach_agence_Sav = $_smarty_tpl->tpl_vars['agence'];
?>
                <ul class="tree">
                    <li class="department"><?php echo $_smarty_tpl->tpl_vars['agence']->value->name;?>
</li>
                    <li>
                        <a class="edit" href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/<?php echo $_SESSION['accountInfo'];?>
/agency/<?php echo $_smarty_tpl->tpl_vars['agence']->value->id;?>
"
                           data-toggle="tooltip" data-placement="left" title="info de l'agence">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </a>
                    </li>
                </ul>  
            <?php
$_smarty_tpl->tpl_vars['agence'] = $foreach_agence_Sav;
}
?>
        </ul>  
    </div>
</div>




<?php }
}
?>
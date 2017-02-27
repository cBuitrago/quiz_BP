<?php /* Smarty version 3.1.27, created on 2017-02-27 14:40:25
         compiled from "/var/www/html/quiz_panel/com/novaconcept/page/smarty/user_panel/UserFront.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:194323582858b43a591cdb67_57819962%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'f640b5f5a716c0537c84794b359d7671bb706f46' => 
    array (
      0 => '/var/www/html/quiz_panel/com/novaconcept/page/smarty/user_panel/UserFront.tpl',
      1 => 1487972330,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '194323582858b43a591cdb67_57819962',
  'variables' => 
  array (
    'view' => 0,
    'lang' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_58b43a591e48e3_72306823',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_58b43a591e48e3_72306823')) {
function content_58b43a591e48e3_72306823 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '194323582858b43a591cdb67_57819962';
if ((isset($_smarty_tpl->tpl_vars['view']->value->is_agency_admin) && $_smarty_tpl->tpl_vars['view']->value->is_agency_admin === TRUE) || (isset($_smarty_tpl->tpl_vars['view']->value->is_group_admin) && $_smarty_tpl->tpl_vars['view']->value->is_group_admin === TRUE) || (isset($_smarty_tpl->tpl_vars['view']->value->is_corpo_admin) && $_smarty_tpl->tpl_vars['view']->value->is_corpo_admin === TRUE)) {?>
<div>
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#addUserTablist" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
        <li role="presentation"><a href="#manageUserTablist" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
    </ul>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="addUserTablist">
            <h1><?php echo $_smarty_tpl->tpl_vars['lang']->value->user->add;?>
</h1>
            <form id="add_user_form">
                <table>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <label for="email">Username : </label>
                                    </td>
                                    <td>
                                        <input type="text" name="email" id="email">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="firstName">Prenom : </label>
                                    </td>
                                    <td>
                                        <input type="text" name="firstName" id="firstName">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="name">Nom : </label>
                                    </td>
                                    <td>
                                        <input type="text" name="name" id="name">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="password">Mot de passe : </label>
                                    </td>
                                    <td>
                                        <input type="password" name="password" id="password">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="force"><?php echo $_smarty_tpl->tpl_vars['lang']->value->user->force;?>
</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="force" id="force">
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <button type="button" class="edit" id="onUserAdd" 
                                    data-toggle="tooltip" data-placement="left" title="ajouter utilisateur">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </button>
                        </td>
                    </tr>
                </table>
            </form>
            <div id="dataTableUser"></div>
            <h1><?php echo $_smarty_tpl->tpl_vars['lang']->value->user->titleFront;?>
</h1>
        </div>
        <div role="tabpanel" class="tab-pane" id="manageUserTablist">
            <table id="usersTable" class="display" width="100%"></table>
        </div>
    </div>
</div>
<?php }
}
}
?>
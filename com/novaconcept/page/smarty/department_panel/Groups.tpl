<div>
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#infoCorpo" aria-controls="home" role="tab" data-toggle="tab">CORPO INFO</a></li>
        <li role="presentation"><a href="#manageGroups" aria-controls="profile" role="tab" data-toggle="tab">GESTION DE GROUPS</a></li>
    </ul>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="infoCorpo">
            <h1>{$data->corpo->name}</h1>
            <h2>Editer Corpo</h2>
            <form id="edit_department_form" method="post">
                <table>
                    <input type="hidden" name="id" id="id" value="{$data->corpo->id}">
                    <input type="hidden" name="description" id="description" value="IS_CORPO">
                    <input type="hidden" name="parent" id="parent" value="{$data->corpo->parent}">
                    <tr>
                        <td>
                            <label for="name">Nom du Corpo</label>
                        </td>
                        <td>
                            <input type="text" name="name" id="name" value="{$data->corpo->name}">
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
                    <input type="hidden" name="parent" id="parent" value="{$data->corpo->id}">
                    <tr>
                        <td>
                            <label for="name">{$lang->department->name}</label>
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
                {foreach from=$data->groups item=group}
                    <ul class="tree">
                        <li class="department">{$group->name}</li>
                        <li><a class="edit" href="{$head->baseUrl}/{$smarty.session.accountInfo}/group/{$group->id}" data-toggle="tooltip" data-placement="left" title="info du groupe"><span class="glyphicon glyphicon-pencil"></span></a>
                    </ul>  
                {/foreach}
            </ul>
        </div>
    </div>
</div>










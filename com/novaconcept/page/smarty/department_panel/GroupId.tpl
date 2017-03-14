<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active">
        <a href="#infoGroup" aria-controls="home" role="tab" data-toggle="tab">Groupe Info</a>
    </li>
</ul>
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active bg-image" id="infoGroup">
        <div class="editItem">
            <h1>Éditer Groupe</h1>
            <p>Nom du groupe</p>
            <form id="edit_department_form" method="post">
                <input type="hidden"    name="id"           id="id"             value="{$data->group->id}">
                <input type="hidden"    name="description"  id="description"    value="IS_GROUP">
                <input type="hidden"    name="parent"       id="parent"         value="{$data->group->parent}">
                <input type="text"      name="name"         id="name"           value="{$data->group->name}" class="editInput" >
                <div class="double-input">
                    <button type="button" class="cancel" id="cancelAll" 
                            data-toggle="tooltip" data-placement="left" title="">
                        Annuler
                    </button>
                    <button type="button" class="edit" id="onDepartmentEdit" 
                            data-toggle="tooltip" data-placement="left" title="editer le nom du group">
                        Éditer
                    </button>
                </div>
            </form>
        </div>
        <div class="addItem">
            <h1>Agences du Groupe</h1>
            <table class="">
                <tbody>
                    {foreach from=$data->agency item=agence}
                        <tr>
                            <td>
                                <a class="" href="{$head->baseUrl}/{$smarty.session.accountInfo}/agency/{$agence->id}">{$agence->name}</a>
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>
</div>
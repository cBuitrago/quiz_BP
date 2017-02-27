<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#infoGroup" aria-controls="home" role="tab" data-toggle="tab">GROUPE INFO</a></li>
    <li role="presentation"><a href="#manageAgences" aria-controls="profile" role="tab" data-toggle="tab">GESTION DE AGENCES</a></li>
</ul>
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="infoGroup">
        <h1>{$data->group->name}</h1>
        <h2>Editer Group</h2>
        <form id="edit_department_form" method="post">
            <table>
                <input type="hidden" name="id" id="id" value="{$data->group->id}">
                <input type="hidden" name="description" id="description" value="IS_GROUP">
                <input type="hidden" name="parent" id="parent" value="{$data->group->parent}">
                <tr>
                    <td>
                        <label for="name">Nom du groupe</label>
                    </td>
                    <td>
                        <input type="text" name="name" id="name" value="{$data->group->name}">
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
                <input type="hidden" name="parent" id="parent" value="{$data->group->id}">
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
            {foreach from=$data->agency item=agence}
                <ul class="tree">
                    <li class="department">{$agence->name}</li>
                    <li>
                        <a class="edit" href="{$head->baseUrl}/{$smarty.session.accountInfo}/agency/{$agence->id}"
                           data-toggle="tooltip" data-placement="left" title="info de l'agence">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </a>
                    </li>
                </ul>  
            {/foreach}
        </ul>  
    </div>
</div>





<div>
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active">
            <a href="#infoCorpo" aria-controls="home" role="tab" data-toggle="tab">CORPO INFO</a>
        </li>
        <li role="presentation">
            <a href="#manageGroups" aria-controls="profile" role="tab" data-toggle="tab">GESTION DE GROUPS</a>
        </li>
    </ul>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active bg-image" id="infoCorpo">
            <div class="editItem">
                <h1>Éditer Corpo</h1>
                <p>Nom du corpo</p>
                <form id="edit_department_form" method="post">
                    <input type="hidden"    name="id"           id="id"             value="{$data->corpo->id}">
                    <input type="hidden"    name="description"  id="description"    value="IS_CORPO">
                    <input type="hidden"    name="parent"       id="parent"         value="{$data->corpo->parent}">
                    <input type="text"      name="name"         id="name"           value="{$data->corpo->name}" class="editInput" >
                    <div class="double-input">
                        <button type="button" class="cancel" id="cancelAll" 
                                data-toggle="tooltip" data-placement="left" title="">
                            Annuler
                        </button>
                        <button type="button" class="edit" id="onDepartmentEdit" 
                                data-toggle="tooltip" data-placement="left" title="editer le nom du corpo">
                            Éditer
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane bg-image" id="manageGroups">
            <div class="addItem">
                <h1>Ajouter Groupe</h1>
                <form id="add_department_form" method="post">
                    <input type="hidden" name="description" id="description" value="IS_GROUP">
                    <input type="hidden" name="parent" id="parent" value="{$data->corpo->id}">
                    <input type="text" name="name" id="name">
                    <button type="button" class="edit" id="onDepartmentAdd" 
                            data-toggle="tooltip" data-placement="left" title="ajouter groupe">
                        Créér groupe
                    </button>
                </form>
            </div>
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










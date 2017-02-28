<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active">
        <a href="#infoGroup" aria-controls="home" role="tab" data-toggle="tab">GROUPE INFO</a>
    </li>
    <li role="presentation">
        <a href="#manageAgences" aria-controls="profile" role="tab" data-toggle="tab">GESTION DE AGENCES</a>
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
    </div>
    <div role="tabpanel" class="tab-pane bg-image" id="manageAgences">
        <div class="addItem">
            <h1>Ajouter Agence</h1>
            <form id="add_department_form" method="post">
                <input type="hidden"    name="description"  id="description"    value="IS_AGENCY">
                <input type="hidden"    name="parent"       id="parent"         value="{$data->group->id}">
                <input type="text"      name="name"         id="name"           placeholder="Nom de l'agence">
                <button type="button" class="edit"  id="onDepartmentAdd" 
                        data-toggle="tooltip" data-placement="left" title="ajouter une agence">
                    Créér agence
                </button>
            </form>
        </div>
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
<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#infoAgency" aria-controls="home" role="tab" data-toggle="tab">AGENCE INFO</a></li>
    <li role="presentation"><a href="#manageUsers" aria-controls="profile" role="tab" data-toggle="tab">GESTION D'UTILISATEURS</a></li>
</ul>
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active bg-image" id="infoAgency">
        <div role="tabpanel" class="tab-pane active bg-image" id="infoCorpo">
            <div class="editItem">
                <h1>Éditer Agence</h1>
                <p>Nom de l'agence</p>
                <form id="edit_department_form" method="post">
                    <input type="hidden" name="id" id="id" value="{$data->agency->id}">
                    <input type="hidden" name="description" id="description" value="IS_AGENCY">
                    <input type="hidden" name="parent" id="parent" value="{$data->group->id}">
                    <input type="text" name="name" id="name"  class="editInput" value="{$data->agency->name}">
                    <div class="double-input">
                        <button type="button" class="cancel" id="cancelAll" 
                                data-toggle="tooltip" data-placement="left" title="">
                            Annuler
                        </button>
                        <button type="button" class="edit" id="onDepartmentEdit" 
                                data-toggle="tooltip" data-placement="left" title="editer le nom de l'agence">
                            Éditer
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div role="tabpanel" class="tab-pane" id="manageUsers">
        <table id="dataTableAgency" class="display" cellspacing="0" width="100%"></table>
    </div>
</div>
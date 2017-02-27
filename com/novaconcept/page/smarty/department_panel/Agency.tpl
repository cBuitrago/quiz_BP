<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#infoAgency" aria-controls="home" role="tab" data-toggle="tab">AGENCE INFO</a></li>
    <li role="presentation"><a href="#manageUsers" aria-controls="profile" role="tab" data-toggle="tab">GESTION D'UTILISATEURS</a></li>
</ul>
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="infoAgency">
        <h1>{$data->agency->name}</h1>
        <h2>Editer Agence</h2>
        <form id="edit_department_form" method="post">
            <table>
                <input type="hidden" name="id" id="id" value="{$data->agency->id}">
                <input type="hidden" name="description" id="description" value="IS_AGENCY">
                <input type="hidden" name="parent" id="parent" value="{$data->group->id}">
                <tr>
                    <td>
                        <label for="name">Nom de l'agence</label>
                    </td>
                    <td>
                        <input type="text" name="name" id="name" value="{$data->agency->name}">
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
</div>
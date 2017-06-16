{if isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE }
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active">
            <a href="#manageGroups" aria-controls="profile" role="tab" data-toggle="tab">Groupes</a>
        </li>
        <li role="presentation">
            <a href="#addGroup" aria-controls="profile" role="tab" data-toggle="tab">Ajouter groupe</a>
        </li>
    </ul>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active bg-image" id="manageGroups">
            <div class="addItem">
                <h1>Groupes</h1>
                <table class="">
                    <tbody>
                        {foreach from=$data->groups item=group}
                            <tr>
                                <td>
                                    <a class="" href="{$head->baseUrl}/{$smarty.session.accountInfo}/group/{$group->id}">{$group->name}</a>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane bg-image" id="addGroup">
            <div class="addItem">
                <h1>Ajouter Groupe</h1>
                <form id="add_department_form" method="post">
                    <input type="hidden" name="description" id="description" value="IS_GROUP">
                    <input type="hidden" name="parent" id="parent" value="{$data->corpo->id}">
                    <input type="text" name="name" id="name">
                    <button type="button" class="nv-btn-default nv-principal-color" id="onDepartmentAdd" 
                            data-toggle="tooltip" data-placement="left" title="ajouter groupe">
                        Créér groupe
                    </button>
                </form>
            </div>
        </div>
    </div>
{/if}
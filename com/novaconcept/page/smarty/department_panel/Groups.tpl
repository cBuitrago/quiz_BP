{if isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE }
    <div>
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#infoCorpo" aria-controls="home" role="tab" data-toggle="tab">Corpo Info</a>
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
                <div class="addItem">
                    <h1>Groupes du Corpo</h1>
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
        </div>
    </div>
{/if}
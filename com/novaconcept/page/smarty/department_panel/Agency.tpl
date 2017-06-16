{if isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE || 
isset($view->is_group_admin) && $view->is_group_admin === TRUE}
<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active">
        <a href="#manageAgences" aria-controls="profile" role="tab" data-toggle="tab">Agences</a>
    </li>
    <li role="presentation">
        <a href="#addAgence" aria-controls="profile" role="tab" data-toggle="tab">Ajouter agence</a>
    </li>
</ul>
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active bg-image" id="manageAgences">
        <div class="addItem">
            <h1>Agences</h1>
            <table class="">
                <tbody>
                    {if isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE }
                        {foreach from=$data->agency item=agence}
                            <tr>
                                <td>
                                    <a class="" href="{$head->baseUrl}/{$smarty.session.accountInfo}/agency/{$agence->id}">{$agence->name}</a>
                                </td>
                            </tr>
                        {/foreach}
                    {else if isset($view->is_group_admin) && $view->is_group_admin === TRUE}
                        {foreach from=$data->group->agency item=agence}
                            <tr>
                                <td>
                                    <a class="" href="{$head->baseUrl}/{$smarty.session.accountInfo}/agency/{$agence->id}">{$agence->name}</a>
                                </td>
                            </tr>
                        {/foreach}
                    {/if}
                </tbody>
            </table>
        </div>
    </div>
    <div role="tabpanel" class="tab-pane bg-image" id="addAgence">
        <div class="addItem">
            <h1>Ajouter Agence</h1>
            <form id="add_department_form" method="post">
                <input type="hidden"    name="description"  id="description"    value="IS_AGENCY">
                <input type="text"      name="name"         id="name"           placeholder="Nom de l'agence">
                {if isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE }
                    <select name="parent"       id="parent">
                        {foreach from=$data->group->groups item=group}
                            <option value="{$group->id}">{$group->name}</option>
                        {/foreach}
                    </select>
                {else if isset($view->is_group_admin) && $view->is_group_admin === TRUE}
                    <input type="hidden"    name="parent"       id="parent"         value="{$data->group->group->id}">
                {/if}
                <button type="button" class="nv-btn-default nv-principal-color"  id="onDepartmentAdd" 
                        data-toggle="tooltip" data-placement="left" title="ajouter une agence">
                    Créér agence
                </button>
            </form>
        </div>
    </div>
</div>
{/if}
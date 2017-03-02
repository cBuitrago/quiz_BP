<div>
    <ul class="nav nav-tabs" role="tablist">
        <p>{$data->firstName} {$data->name}</p>
    </ul>
</div>
<form id="edit_user_form">
    <input type="hidden" name="id" id="id" value="{$data->id}">
    <div class="containerEdit">
        <h1>Éditer Information</h1>
        <div class="double-input">
            <div>
                <label for="firstName">Prénom</label>
                <input type="text" name="firstName" id="firstName" value="{$data->firstName}">
            </div>
            <div>
                <label for="name">Nom de famille</label>
                <input type="text" name="name" id="name" value="{$data->name}">
            </div>
        </div>
        <div class="single-input">
            <label for="username">Username</label>
            <input type="text" name="username" id="username" value="{$data->username}">
        </div>
        <div class="double-input">
            <div>
                <label for="authentication_attempt_fail">Tentatives échouées</label>
                <input type="text" name="authentication_attempt_fail" id="authentication_attempt_fail" 
                       value="{$data->userAuthentication->attemptFail}">
            </div>
            <div>
                <label for="created">Créé : </label>
                <input type="text" name="created" id="created" value="{date($lang->dateFormat, $data->createdOn)}" disabled="disabled">
            </div>
        </div>
        <div class="double-input">
            <div>
                <input type="checkbox" name="authentication_is_active" id="authentication_is_active" 
                       value="authentication_is_active" {if $data->userAuthentication->isActive === TRUE}checked{/if}>
                <label for="authentication_is_active">{$lang->user->isActive}</label>
            </div>
            <div>
                <input type="checkbox" name="authentication_force_change" id="authentication_is_active" 
                       value="authentication_force_change" {if $data->userAuthentication->isActive === TRUE}checked{/if}>
                <label for="authentication_force_change">Forcer changement du psw</label>
            </div>
        </div>
        <div class="double-input">
            <button type="button" class="cancel cancelAll" 
                    data-toggle="tooltip" data-placement="left" title="">
                Annuler
            </button>
            <button type="button" class="edit" id="onUserEdit" 
                    data-toggle="tooltip" data-placement="left" title="editer info de l'utilisateur">
                Éditer
            </button>
        </div>
    </div>
</form>
<hr>
<form id="edit_user_permission_form">
    <div class="containerEdit">
        <h1>{$lang->user->infoAuthorization}</h1>
        <div>
            <input type="hidden" name="prevoius_permission" value="{$data->userAuthorization[0]->id}" >
            <input type="radio" id="corpo_permission" name="permission_list" value="14" 
                   {if isset($data->userAuthorization[0]->userPermission) && $data->userAuthorization[0]->userPermission == "14" }checked{/if}
                   {if (isset($view->is_group_admin) && $view->is_group_admin === TRUE) ||
                                    (isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) ||
                                    (isset($view->is_user) && $view->is_user === TRUE) } disabled="disabled"{/if}>
            <label for="corpo_permission"> Administrateur Corpo</label><br/>
            <input type="radio" id="group_permission" name="permission_list" value="15" 
                   {if isset($data->userAuthorization[0]->userPermission) && $data->userAuthorization[0]->userPermission == "15" }checked{/if}
                   {if (isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) ||
                                    (isset($view->is_user) && $view->is_user === TRUE) } disabled="disabled"{/if}>
            <label for="group_permission"> Administrateur Groupe</label><br/>
            <input type="radio" id="agency_permission" name="permission_list" value="16" 
                   {if isset($data->userAuthorization[0]->userPermission) && $data->userAuthorization[0]->userPermission == "16" }checked{/if}
                   {if (isset($view->is_user) && $view->is_user === TRUE) } disabled="disabled"{/if}>
            <label for="agency_permission"> Administrateur Agency</label><br/>
            <input type="radio" id="user_permission" name="permission_list" value="17" 
                   {if isset($data->userAuthorization[0]->userPermission) && $data->userAuthorization[0]->userPermission == "17" }checked{/if}>
            <label for="user_permission"> Utilisateur</label><br/>
        </div>
        <div class="double-input">
            <button type="button" class="cancel cancelAll"  
                    data-toggle="tooltip" data-placement="left" title="">
                Annuler
            </button>
            <button type="button" class="edit" id="onUserEditPermission" 
                    data-toggle="tooltip" data-placement="left" title="changer permission de l'utilisateur">
                Éditer
            </button>
        </div>
    </div>
</form>
{if (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) ||
    (isset($view->is_group_admin) && $view->is_group_admin === TRUE) }
<hr>
<form id="edit_user_agency_form">
    <div class="containerEdit">
        <h1>AGENCY</h1>
        <div>
            <input type="hidden" name="id" id="id" value="{$data->departmentAuthorization[0]->id}">
            {foreach from=$data->agencies item=department}
                <input type="radio" id="user_agency_{$department->id}" name="user_agency" value="{$department->id}" 
                       {if $department->id == $data->departmentInfo[0]->id }checked{/if}>
                <label for="user_agency_{$department->id}"> {$department->name} ({$department->parentName})</label><br/>
            {/foreach}
        </div>
        <div class="double-input">
            <button type="button" class="cancel cancelAll" 
                    data-toggle="tooltip" data-placement="left" title="">
                Annuler
            </button>
            <button type="button" class="edit" id="onUserEditAgency"
                    data-toggle="tooltip" data-placement="left" title="changer l'agency de l'utilisateur">
                Éditer
            </button>
        </div>
    </div>
</form>
{/if}
    {if (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) ||
    ((isset($view->is_group_admin) && $view->is_group_admin === TRUE) && 
    (isset($data->userAuthorization[0]->userPermission) && $data->userAuthorization[0]->userPermission == "16" || 
    isset($data->userAuthorization[0]->userPermission) && $data->userAuthorization[0]->userPermission == "17" )) ||
    ((isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) && 
    (isset($data->userAuthorization[0]->userPermission) && $data->userAuthorization[0]->userPermission == "17" ))}
    <hr>
    <form id="change_user_password_form">
        <div class="containerEdit">
            <h1>CHANGER MOT DE PASSE</h1>
            <input type="hidden" name="id" id="id" value="{$data->id}">
            <div class="double-input">
                <div>
                    <label for="psw">{$lang->user->newPsw}</label>
                    <input type="text" name="psw" id="psw" >
                </div>
                <div>
                    <label for="psw">{$lang->user->newPsw}</label>
                    <input type="text" name="psw" id="psw" >
                </div>
            </div>
            <div class="double-input">
                <button type="button" class="cancel cancelAll"  
                        data-toggle="tooltip" data-placement="left" title="">
                    Annuler
                </button>
                <button type="button" class="edit" id="onUserChangePassword"
                        data-toggle="tooltip" data-placement="left" title="changer mot de passe de l'utilisateur">
                    Éditer
                </button>
            </div>
        </div>
    </form>
    <hr>
    <form>
        <div class="containerEdit">
            <button type="button" class="remove" id="onUserRemove">Effacer Utilisateur</button>
        </div>
    </form>
    {/if}
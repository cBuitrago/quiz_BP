<h1>{$lang->user->edit}</h1>
<h2>{$lang->user->info}</h2>
<form id="edit_user_form">
    <table>
        <tr>
            <td>
                <table>
                    <input type="hidden" name="id" id="id" value="{$data->id}">
                    <tr>
                        <td>
                            <label for="firstName">{$lang->user->firstName}</label>
                        </td>
                        <td>
                            <input type="text" name="firstName" id="firstName" value="{$data->firstName}">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="name">{$lang->user->name}</label>
                        </td>
                        <td>
                            <input type="text" name="name" id="name" value="{$data->name}">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="username">{$lang->user->username}</label>
                        </td>
                        <td>
                            <input type="text" name="username" id="username" value="{$data->username}">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="authentication_is_active">{$lang->user->isActive}</label>
                        </td>
                        <td>
                            <input type="checkbox" name="authentication_is_active" id="authentication_is_active" 
                                   value="authentication_is_active" {if $data->userAuthentication->isActive === TRUE}checked{/if}>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="authentication_attempt_fail">{$lang->user->attempt_limit}</label>
                        </td>
                        <td>
                            <input type="text" name="authentication_attempt_fail" id="authentication_attempt_fail" 
                                   value="{$data->userAuthentication->attemptFail}">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="authentication_force_change">{$lang->user->force}</label>
                        </td>
                        <td>
                            <input type="checkbox" name="authentication_force_change" id="authentication_force_change" 
                                   {if $data->userAuthentication->forceChange === TRUE}checked{/if}>
                        </td>
                    </tr>
                    <tr>
                        <td>{$lang->user->created}</td>
                        <td>{date($lang->dateFormat, $data->createdOn)}</td>
                    </tr>
                </table>
            </td>
            <td>
                <button type="button" class="edit" id="onUserEdit" 
                        data-toggle="tooltip" data-placement="left" title="editer info de l'utilisateur">
                    <span class="glyphicon glyphicon-pencil"></span>
                </button>
            </td>
        </tr>
    </table>
</form>
<h2>{$lang->user->infoAuthorization}</h2>
<form id="edit_user_permission_form">
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
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
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <button type="button" class="edit" id="onUserEditPermission" 
                        data-toggle="tooltip" data-placement="left" title="changer permission de l'utilisateur">
                    <span class="glyphicon glyphicon-pencil"></span>
                </button>
            </td>
        </tr>
    </table>
</form>
{if (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) ||
    (isset($view->is_group_admin) && $view->is_group_admin === TRUE) }
<h2>AGENCY</h2>
<form id="edit_user_agency_form">
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <input type="hidden" name="id" id="id" value="{$data->departmentAuthorization[0]->id}">
                            {foreach from=$data->agencies item=department}
                                <input type="radio" id="user_agency_{$department->id}" name="user_agency" value="{$department->id}" 
                                       {if $department->id == $data->departmentInfo[0]->id }checked{/if}>
                                <label for="user_agency_{$department->id}"> {$department->name}</label><br/>
                            {/foreach}
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <button type="button" class="edit" id="onUserEditAgency"
                        data-toggle="tooltip" data-placement="left" title="changer l'agency de l'utilisateur">
                    <span class="glyphicon glyphicon-pencil"></span>
                </button>
            </td>
        </tr>
    </table>
</form>
{/if}
    {if (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) ||
    ((isset($view->is_group_admin) && $view->is_group_admin === TRUE) && 
    (isset($data->userAuthorization[0]->userPermission) && $data->userAuthorization[0]->userPermission == "16" || 
    isset($data->userAuthorization[0]->userPermission) && $data->userAuthorization[0]->userPermission == "17" )) ||
    ((isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) && 
    (isset($data->userAuthorization[0]->userPermission) && $data->userAuthorization[0]->userPermission == "17" ))}
    <h2>CHANGER MOT DE PASSE</h2>
    <form id="change_user_password_form">
        <table>
            <tr>
                <td>
                    <table>
                        <input type="hidden" name="id" id="id" value="{$data->id}">
                        <tr>
                            <td>
                                <label for="psw">{$lang->user->newPsw}</label>
                            </td>
                            <td>
                                <input type="text" name="psw" id="psw" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="psw1">{$lang->user->newPswVerification}</label>
                            </td>
                            <td>
                                <input type="text" name="psw1" id="psw1" >
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <button type="button" class="edit" id="onUserChangePassword"
                            data-toggle="tooltip" data-placement="left" title="changer mot de passe de l'utilisateur">
                        <span class="glyphicon glyphicon-pencil"></span>
                    </button>
                </td>
            </tr>
        </table>
    </form>
    <form>
        <table>
            <tr>
                <td>
                    <button type="button" class="remove" id="onUserRemove">{$lang->user->remove}</button>
                </td>
            </tr>
        </table>
    </form>
    {/if}
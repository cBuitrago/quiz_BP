{if (isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) ||
(isset($view->is_group_admin) && $view->is_group_admin === TRUE) ||
(isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE)
}
<div>
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#addUserTablist" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
        <li role="presentation"><a href="#manageUserTablist" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
    </ul>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="addUserTablist">
            <h1>{$lang->user->add}</h1>
            <form id="add_user_form">
                <table>
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <label for="email">Username : </label>
                                    </td>
                                    <td>
                                        <input type="text" name="email" id="email">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="firstName">Prenom : </label>
                                    </td>
                                    <td>
                                        <input type="text" name="firstName" id="firstName">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="name">Nom : </label>
                                    </td>
                                    <td>
                                        <input type="text" name="name" id="name">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="password">Mot de passe : </label>
                                    </td>
                                    <td>
                                        <input type="password" name="password" id="password">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="force">{$lang->user->force}</label>
                                    </td>
                                    <td>
                                        <input type="checkbox" name="force" id="force">
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <button type="button" class="edit" id="onUserAdd" 
                                    data-toggle="tooltip" data-placement="left" title="ajouter utilisateur">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </button>
                        </td>
                    </tr>
                </table>
            </form>
            <div id="dataTableUser"></div>
            <h1>{$lang->user->titleFront}</h1>
        </div>
        <div role="tabpanel" class="tab-pane" id="manageUserTablist">
            <table id="usersTable" class="display" width="100%"></table>
        </div>
    </div>
</div>
{/if}
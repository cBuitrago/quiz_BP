{if (isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) ||
(isset($view->is_group_admin) && $view->is_group_admin === TRUE) ||
(isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE)
}
<div>
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active">
            <a href="#manageUserTablist" aria-controls="profile" role="tab" data-toggle="tab">Gestion des utilisateurs</a>
        </li>
        <li role="presentation" >
            <a href="#addUserTablist" aria-controls="home" role="tab" data-toggle="tab">Ajouter utilisateur</a>
        </li>
    </ul>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="manageUserTablist">
            <table id="usersTable" class="display" width="100%"></table>
        </div>
        <div role="tabpanel" class="tab-pane bg-image" id="addUserTablist">
            <div class="addItem">
                <h1>Ajouter Utilisateur</h1>
                <form id="add_user_form">
                    <input type="text" name="email" id="email" placeholder="Nom d'utilisateur">
                    <div class="double-input">
                        <input type="text" name="firstName" id="firstName" placeholder="Prénom">
                        <input type="text" name="name" id="name" placeholder="Nom de famille">
                    </div>
                    <input type="password" name="password" id="password" placeholder="Mot de passe">
                    <input type="checkbox" name="force" id="force"><label for="force">Changer mot de passe?</label>
                    <button type="button" class="add" id="onUserAdd" 
                            data-toggle="tooltip" data-placement="left" title="ajouter utilisateur">
                        Créér utilisateur
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
{/if}
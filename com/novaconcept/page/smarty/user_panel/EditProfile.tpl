{strip}
    <html>
        {include file="com/novaconcept/page/smarty/includes/HeadTag.tpl" lang=$lang head=$head view=$view}
        <body>
            {include file="com/novaconcept/page/smarty/includes/NavTag.tpl" lang=$lang head=$head view=$view}
            <article class="container">
                <article class="aside">
                    {include file="com/novaconcept/page/smarty/includes/Aside.tpl" lang=$lang head=$head view=$view}
                </article>
                <article class="center">
                    <div>
                        <ul class="nav nav-tabs" role="tablist">
                            <p>Information personnelle</p>
                        </ul>
                    </div>
                    <form id="edit_user_profile_form">
                        <div class="containerEdit">
                            <h1>Éditer Information</h1>
                            <div class="double-input">
                                <div>
                                    <label for="firstName">{$lang->user->firstName}</label>    
                                    <input type="text" name="firstName" id="firstName" value="{$smarty.session.userInfo->firstName}" >  
                                </div>
                                <div>
                                    <label for="name">{$lang->user->name}</label>
                                    <input type="text" name="name" id="name" value="{$smarty.session.userInfo->name}" >
                                </div>
                            </div>
                            <div>
                                <label for="username">{$lang->user->username}</label>
                                <input type="text" name="username" id="username" value="{$smarty.session.userInfo->username}" >
                            </div>
                            <div class="double-input">
                                <button type="button" class="cancel cancelAll" 
                                        data-toggle="tooltip" data-placement="left" title="">
                                    Annuler
                                </button>
                                <button type="button" class="edit" id="onUserEditProfile" 
                                        data-toggle="tooltip" data-placement="left" title="editer info de l'utilisateur">
                                    Éditer
                                </button>
                            </div>
                        </div>
                    </form>
                    <hr>
                    <form id="edit_user_password_form">
                        <div class="containerEdit">
                            <h1>CHANGER MOT DE PASSE</h1>
                            <div class="double-input">
                                <div>
                                    <label for="psw">{$lang->user->newPsw}</label>
                                    <input type="text" name="psw" id="psw" >
                                </div>
                                <div>
                                    <label for="psw1">{$lang->user->newPsw}</label>
                                    <input type="text" name="psw1" id="psw1" >
                                </div>
                            </div>
                            <div class="double-input">
                                <button type="button" class="cancel cancelAll"  
                                        data-toggle="tooltip" data-placement="left" title="">
                                    Annuler
                                </button>
                                <button type="button" class="edit" id="onUserEditPassword"
                                        data-toggle="tooltip" data-placement="left" title="changer mot de passe">
                                    Éditer
                                </button>
                            </div>
                        </div>
                    </form>
                </article>
                <footer>
                    <div class="footer">
                        <p>{$lang->includes->footer}</p>
                    </div>
                </footer>
        </body>
    </html>
{/strip}
{strip}
    <html>
        {include file="com/novaconcept/page/smarty/includes/HeadTag.tpl" lang=$lang head=$head view=$view}
        <body>

            <nav class="head">
                <div class="image">
                    <img src="/quiz_panel/media/images/logoCompany.png">
                </div>
                <div class="dropdown">
                    <button class="dropdown-toggle" type="button" id="profile-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        {$smarty.session.userInfo->firstName} {$smarty.session.userInfo->name}
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="profile-dropdown">
                        <li><a href="{$head->baseUrl}/logout">{$lang->includes->logOut}</a></li>
                    </ul>
                </div>
            </nav>
            <article class="container">
                <article class="aside">
                </article>
                <article class="center">
                    <div>
                        <ul class="nav nav-tabs" role="tablist">
                            <p>Changez votre mot de passe s.v.p!</p>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane bg-image active" id="">
                                <div class="addItem">
                                    <h1>Mot de passe</h1>
                                    <form id="edit_user_password_form">
                                        <div class="single-input">
                                            <input type="password" name="psw" id="psw" placeholder="Nouveau mot de passe">
                                        </div>
                                        <div class="single-input">
                                            <input type="password" name="psw1" id="psw1" placeholder="Confirmer le mot de passe">
                                        </div>
                                        <button type="button" class="add" id="onUserEditPassword" 
                                                data-toggle="tooltip" data-placement="left" title="change mot de passe">
                                            Modifier mot de passe
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
            </article>
        </body>
    </html>
{/strip}
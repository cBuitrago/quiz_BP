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
                    <h1>{$lang->user->profile}</h1>
                    <form id="edit_user_profile_form">
                        <table>
                            <tr>
                                <td><label for="firstName">{$lang->user->firstName}</label></td>
                                <td><input type="text" name="firstName" id="firstName" value="{$smarty.session.userInfo->firstName}" ></td>
                            </tr>
                            <tr>
                                <td><label for="name">{$lang->user->name}</label></td>
                                <td><input type="text" name="name" id="name" value="{$smarty.session.userInfo->name}" ></td>
                            </tr>
                            <tr>
                                <td><label for="username">{$lang->user->username}</label></td>
                                <td><input type="text" name="username" id="username" value="{$smarty.session.userInfo->username}" ></td>
                            </tr>
                        </table>
                        <button type="button" class="save" id="onUserEditProfile">{$lang->user->edit}</button>
                    </form>
                    <form id="edit_user_password_form">
                        <table>
                            <tr>
                                <td><label for="psw">{$lang->user->newPsw}</label></td>
                                <td><input type="password" name="psw" id="psw" ></td>
                            </tr>
                            <tr>
                                <td><label for="psw1">{$lang->user->newPswVerification}</label></td>
                                <td><input type="password" name="psw1" id="psw1" ></td>
                            </tr>
                        </table>
                        <button type="button" class="save" id="onUserEditPassword">{$lang->user->change}</button>
                    </form>
                </article>
            </article>
            <footer>
                <div class="footer">
                    <p>{$lang->includes->footer}</p>
                </div>
            </footer>
        </body>
    </html>
{/strip}
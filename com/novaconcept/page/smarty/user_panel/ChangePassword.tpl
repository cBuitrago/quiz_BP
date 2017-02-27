{strip}
<html>
    {include file="com/novaconcept/page/smarty/includes/HeadTag.tpl" lang=$lang head=$head view=$view}
    <body>
        <article class="title-top">
            <div class="title-container">
                <h1>{$smarty.session.accountName}</h1>
                {include file="com/novaconcept/page/smarty/includes/NavTag.tpl" lang=$lang head=$head view=$view}
            </div>
        </article>
        <article class="container">
            <article class="aside">
            </article>
            <article class="center">
                <h1>{$lang->user->change}</h1>
                <form id="edit_user_password_form">
                    <table>
                        <tr><td><label for="psw">{$lang->user->newPsw}</label></td><td><input type="text" name="psw" id="psw" ></td></tr>
                        <tr><td><label for="psw1">{$lang->user->newPswVerification}</label></td><td><input type="text" name="psw1" id="psw1" ></td></tr>
                    </table>
                    <button type="button" class="save" id="onUserEditPassword">{$lang->user->change}</button>
                </form>
            </article>
        </article>
    </body>
</html>
{/strip}
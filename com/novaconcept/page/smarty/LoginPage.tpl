<html>
    {include file="com/novaconcept/page/smarty/includes/HeadTag.tpl" lang=$lang head=$head}
    <body class="login">
        <nav>
            <div class="image">
                <img src="/quiz_panel/media/images/logoCompany.png">
            </div>
            <div class="text-login">
                <h1>Login</h1>
            </div>
        </nav>
        <article class="content-login">
            <form>
                <div>
                    <input type="text" id="username" name="username" placeholder="Courriel" >
                </div>
                <div>
                    <input type="password" id="psw" name="psw" placeholder="Mot de Passe" >
                </div>
                <div class="login_failed hidden_failed">
                    <p>Connexion échoué!</p>
                </div>
                <hr>
                <button type="submit" id="onLogin">Entrer</button>
            </form>
        </article
    </body>
</html>
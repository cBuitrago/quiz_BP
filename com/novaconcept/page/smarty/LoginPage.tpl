<html>
    <head>
        <title>{$view->title}</title>
        <meta charset="UTF-8">
        <link href="{$head->baseUrl}/js/libs/twitter-bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,500' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="{$head->baseUrl}/css/main.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.css"/>
        <script type="text/javascript"> baseUrl = "{$head->baseUrl}";</script>
        <script type="text/javascript">var account = {if isset($smarty.session.accountInfo)}{$smarty.session.accountInfo}{else}0{/if}</script>
        <script src="{$head->baseUrl}/js/libs/jquery/jquery.js" type="text/javascript"></script>
        <script type="text/javascript" src="{$head->baseUrl}/js/libs/twitter-bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js"></script>
        <script src="{$head->baseUrl}/js/main.js" type="text/javascript"></script>
        <style>
            nav, nav div.image{literal}{{/literal}background-color: {$data->colors->nav}{literal}}{/literal}
            article.content-login form button{literal}{{/literal}background-color: {$data->colors->principal}{literal}}{/literal}
            article.content-login form button:hover{literal}{{/literal}background-color: {$data->colors->principal}{literal}}{/literal}
        </style>
    </head>
    <body class="login">
        <nav>
            <div class="image">
                <img src="{$head->baseUrl}/media/images/{$data->logo}">
            </div>
            <div class="text-login">
                <h1>Ouverture de session</h1>
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
        </article>
    </body>
</html>
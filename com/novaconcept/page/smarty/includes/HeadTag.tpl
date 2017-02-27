<head>
    <title>{$view->title}</title>
    <meta charset="UTF-8">
    <link href="{$head->baseUrl}/js/libs/twitter-bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Roboto:300,400' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="{$head->baseUrl}/css/main.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.css"/>
    <script src="{$head->baseUrl}/js/libs/jquery/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.js"></script>
    <script type="text/javascript" src="{$head->baseUrl}/js/libs/twitter-bootstrap/js/bootstrap.js"></script>
    <script src="{$head->baseUrl}/js/main.js" type="text/javascript"></script>
    <script type="text/javascript"> baseUrl = "{$head->baseUrl}";</script>
    <script type="text/javascript">var account = {if isset($smarty.session.accountInfo)}{$smarty.session.accountInfo}{else}0{/if}</script>
</head>
<head>
    <title>{$view->title}</title>
    <meta charset="UTF-8">
    <link href="{$head->baseUrl}/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="{$head->baseUrl}/css/bootstrap-colorpicker.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,500' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="{$head->baseUrl}/css/main.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.css"/>
    <script type="text/javascript"> baseUrl = "{$head->baseUrl}";</script>
    <script type="text/javascript">var account = {if isset($smarty.session.accountInfo)}{$smarty.session.accountInfo}{else}0{/if}</script>
    <script src="{$head->baseUrl}/js/libs/jquery/jquery.js" type="text/javascript"></script>
    <script src="{$head->baseUrl}/js/bootstrap-colorpicker.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="{$head->baseUrl}/js/bootstrap.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js"></script>
    <script src="{$head->baseUrl}/js/main.js" type="text/javascript"></script>
    <style>
        article.aside{literal}{{/literal}background-color: {$smarty.session.accountAside}{literal}}{/literal}
        nav div.image{literal}{{/literal}background-color: {$smarty.session.accountNav}{literal}}{/literal}
        button.add{literal}{{/literal}background-color: {$smarty.session.accountPrincipal};
                                      border-color: {$smarty.session.accountPrincipal}{literal}}{/literal}
        button.cancel{literal}{{/literal}background-color: {$smarty.session.accountBtnCancel};
                                      border-color: {$smarty.session.accountBtnCancel}{literal}}{/literal}
        .nv-principal-color{literal}{{/literal}background-color: {$smarty.session.accountPrincipal}{literal}}{/literal}
        ul.nav-tabs{literal}{{/literal}background-color: {$smarty.session.accountNav2}{literal}}{/literal}
        nav{literal}{{/literal}background-color: {$smarty.session.accountNav}{literal}}{/literal}
        article.center ul.nav-tabs li.active a{literal}{{/literal}background-color: {$smarty.session.accountNav2};
                                                                  border-color: {$smarty.session.accountNav2};
                                                                  border-bottom-color: {$smarty.session.accountPrincipal};{literal}}{/literal}
        article.center ul.nav-tabs li.active a:hover{literal}{{/literal}background-color: {$smarty.session.accountNav2};
                                                                        border-color: {$smarty.session.accountNav2};
                                                                        border-bottom-color: {$smarty.session.accountPrincipal};
        {literal}}{/literal}
        article.center ul.nav-tabs li a:hover{literal}{{/literal}background-color: {$smarty.session.accountNav2};
                                                                 border-color: {$smarty.session.accountNav2};
                                                                 border-bottom-color: {$smarty.session.accountPrincipal};
        {literal}}{/literal}
    </style>
</head>
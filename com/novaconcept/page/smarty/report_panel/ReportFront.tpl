<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>{$view->title}</title>
        <link rel="stylesheet" href="{$head->baseUrl}/css/iframe.css">
        <link rel="stylesheet" type="text/css" href="{$head->baseUrl}/css/jquery.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="{$head->baseUrl}/css/buttons.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="{$head->baseUrl}/css/select.dataTables.min.css">
        <link rel="stylesheet" href="{$head->baseUrl}/css/font-awesome.min.css">
        <link rel="stylesheet" href="{$head->baseUrl}/css/generator.css">
        <link href="{$head->baseUrl}/js/libs/twitter-bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Roboto:300,400,500' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="{$head->baseUrl}/css/main.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.css"/>
        <script type="text/javascript"> baseUrl = "{$head->baseUrl}";</script>
        <script src="{$head->baseUrl}/js/javascript/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.js"></script>
        <script type="text/javascript" src="{$head->baseUrl}/js/bootstrap.js"></script>
        <script type="text/javascript">var account = {if isset($smarty.session.accountInfo)}{$smarty.session.accountInfo}{else}0{/if}</script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.bundle.js"></script>
        <script type="text/javascript" charset="utf8" src="{$head->baseUrl}/js/javascript/jquery.dataTables.min1_10_13.js"></script>
        <script type="text/javascript" charset="utf8" src="{$head->baseUrl}/js/javascript/ellipsis.js"></script>
        <script type="text/javascript" charset="utf8" src="{$head->baseUrl}/js/javascript/dataTables.select.min.js"></script>
        <script type="text/javascript" charset="utf8" src="{$head->baseUrl}/js/javascript/dataTables.buttons.min.js"></script>
        <script src="{$head->baseUrl}/js/utils.min.js" type="text/javascript"></script>
        <script src="{$head->baseUrl}/js/javascript/jspdf_1_2_61.debug.js" type="text/javascript"></script>
        <script src="{$head->baseUrl}/js/javascript/jspdf.plugin.autotable_2_0_22.js" type="text/javascript"></script>
        {*<script src="{$head->baseUrl}/js/javascript/pdf_generator.js" type="text/javascript"></script>*}
        <script src="{$head->baseUrl}/js/pdf_generator_cfc.js"  type="text/javascript"></script>
        <script src="{$head->baseUrl}/js/generator.js"  type="text/javascript"></script>
        <style>
            article.aside{literal}{{/literal}background-color: {$smarty.session.accountAside}{literal}}{/literal}
            nav div.image{literal}{{/literal}background-color: {$smarty.session.accountNav}{literal}}{/literal}
            button.add, input[type=button].btn_filters, a.dt-button{literal}{{/literal}background-color: {$smarty.session.accountPrincipal};
                                          border-color: {$smarty.session.accountPrincipal}{literal}}{/literal}
            button.cancel{literal}{{/literal}background-color: {$smarty.session.accountBtnCancel};
                                             border-color: {$smarty.session.accountBtnCancel}{literal}}{/literal}
            div.tab-content .dataTables_wrapper .dt-buttons a.dt-button.black{literal}{{/literal}background-color: {$smarty.session.accountPrincipal};
                                          border-color: {$smarty.session.accountPrincipal}{literal}}{/literal}
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
    <body bgcolor="black">
        {include file="com/novaconcept/page/smarty/includes/NavTag.tpl" lang=$lang head=$head view=$view}
        <div class="load">
            <div>
                <img src="{$head->baseUrl}/media/assets/loading.gif">
            </div>
        </div>
        <article class="container">
            <article class="aside">
                {include file="com/novaconcept/page/smarty/includes/Aside.tpl" lang=$lang head=$head view=$view}
            </article>
            <article class="center">
                <div>
                    <ul class="nav nav-tabs" role="tablist">
                        <p>Rapports</p>
                    </ul>
                </div>
                <div class="tab-content">
                    <div align="center" style="margin: 30px auto; padding: 0">
                        <div class="filters">
                            <h1>Filtrer les résultats</h1>
                            <div class="fil-select">
                                <label for="filter_quiz_id">ID Quiz </label>
                                <select class='select-filter' id="filter_quiz_id">
                                    <option value="all">Tous</option>
                                </select>
                            </div>
                            <div class="fil-select">
                                <label for="filter_corporate_id">ID Compagnie </label>
                                <select class='select-filter' id="filter_corporate_id">
                                    <option value="all">Tous</option>
                                </select>
                            </div>
                            <div class="fil-select right">
                                <label for="filter_group_id">ID Groupe </label>
                                <select class='select-filter' id="filter_group_id">
                                    <option value="all">Tous</option>
                                </select>
                            </div>
                            <div class="fil-select right">
                                <label for="filter_agency_id">ID Agence </label>
                                <select class='select-filter' id="filter_agency_id">
                                    <option value="all">Tous</option>
                                </select>
                            </div>
                            <div class="fil-select right">
                                <label for="filter_quiz_progress">Progrès </label>
                                <select class='select-filter' id="filter_quiz_progress">
                                    <option value="all">Tous</option>
                                </select>
                            </div>
                        </div>
                        <table id="example" class="display" cellspacing="0"></table>
                        <div class="filters">
                            <div class="rapUsagerHead">
                                <p>Générer les rapports usagers:</p>
                            </div>
                            <div class="rapUsagerBody">
                                <div class="bodyFirstLabel">
                                    <input type="checkbox" id="show_graph" value="show_graph" checked>
                                    <label for="show_graph">Afficher le graphique de résultats</label><br>
                                    <input type="checkbox" id="show_answers" value="show_answers" checked>
                                    <label for="show_answers">Afficher les questions/réponses</label>
                                </div>
                                <div class="bodySelect">
                                    <label for="user_report_compare">Graphique résultats - Comparer usager(s) avec:</label>
                                    <select id="user_report_compare">
                                        <option value="none">Aucun</option>
                                        <option value="AGENCIES">Agence</option>
                                        <option value="GROUPS">Groupe</option>
                                        <option value="CORPORATES">Compagnie</option>
                                    </select><br>
                                    <input type="checkbox" id="show_answers_score" value="show_answers_score" checked>
                                    <label for="show_answers_score">Afficher les pointages obtenus aux questions</label><br>
                                    <input type="checkbox" id="show_best_answers" value="show_best_answers" checked>
                                    <label for="show_best_answers">Afficher les meilleures réponses aux questions</label><br>
                                </div>
                                <div class="bodyButton">
                                    <input type="button" class='btn_filters' value="Générer rapport(s) usager(s)" 
                                           id="GenerateUsersReports" />
                                </div>
                            </div>
                        </div>
                        <div class="filters">
                            <div class="bodyEntete">
                                <p>Générer les rapports de participation:</p>
                            </div>
                            <div class="bodyButton">
                                <input type="button" class='btn_filters' value="Générer rapport de participation" 
                                       id="GenerateParticipationReport"/>
                            </div>
                        </div>
                        <div class="filters">
                            <div class="bodyEntete">
                                <p>Générer les rapports de groupe:</p>
                            </div>
                            <div class="bodyButton">
                                <input type="button" class='btn_filters' value="Générer rapport de groupe" 
                                       id="onGroupeReport"/>
                            </div>
                        </div>
                        <div class="filters">
                            <div class="rapUsagerHead">
                                <p>Générer les rapports de statistics:</p>
                            </div>
                            <div class="rapUsagerBody">
                                <div class="bodyFirstLabel">
                                    <p></p>
                                </div>
                                <div class="bodySelect">
                                    <label for="quiz_report_statistic">Sélectionner quiz:</label>
                                    <select id="quiz_report_statistic">
                                        {foreach from=$data item=quiz}
                                            <option value="{$quiz[0]}">{$quiz[1]}</option>
                                        {/foreach}
                                    </select>
                                    <br>
                                    <br>
                                    <label style="margin: 0;" for="statistic_report_compare">Graphique résultats - Comparer quiz avec:</label>
                                    <select id="statistic_report_compare">
                                        <option value="AGENCIES">Agence</option>
                                        <option value="GROUPS">Groupe</option>
                                        <option value="CORPORATES">Compagnie</option>
                                    </select>
                                </div>
                                <div class="bodyButton">
                                    <input type="button" class='btn_filters' value="Générer rapport de statistics" 
                                           id="GenerateStatisticReport"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </article>
        </article>
        <footer>
            <div class="footer">
                <p>{$lang->includes->footer}</p>
            </div>
        </footer> 
        <div id="popup1" class="overlay">
            <div class="popup">
                <div id="progress_update">
                    <p id="progress_text"></p>
                </div>
            </div>
        </div>
    </body>
</html> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Novaconcept D&eacute;mo - Mise-&agrave;-jours disponibles</title>
        <link rel="stylesheet" href="{$head->baseUrl}/css/iframe.css">
        <link rel="stylesheet" type="text/css" href="{$head->baseUrl}/css/jquery.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="{$head->baseUrl}/css/buttons.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="{$head->baseUrl}/css/select.dataTables.min.css">
        <link rel="stylesheet" href="{$head->baseUrl}/css/font-awesome.min.css">
        <link rel="stylesheet" href="{$head->baseUrl}/css/generator.css">
        <link href="{$head->baseUrl}/js/libs/twitter-bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Roboto:300,400' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="{$head->baseUrl}/css/main.css">
        <!--<script src="{$head->baseUrl}/js/main.js" type="text/javascript"></script>-->
        <!--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.css"/>-->
        <!--<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.js"></script>-->
        <script type="text/javascript"> baseUrl = "{$head->baseUrl}";</script>
        <script src="{$head->baseUrl}/js/javascript/jquery.min.js"></script>
        <script type="text/javascript" src="{$head->baseUrl}/js/libs/twitter-bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript">var account = {if isset($smarty.session.accountInfo)}{$smarty.session.accountInfo}{else}0{/if}</script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.bundle.js"></script>
        <script type="text/javascript" charset="utf8" src="{$head->baseUrl}/js/javascript/jquery.dataTables.min1_10_13.js"></script>
        <script type="text/javascript" charset="utf8" src="{$head->baseUrl}/js/javascript/ellipsis.js"></script>
        <script type="text/javascript" charset="utf8" src="{$head->baseUrl}/js/javascript/dataTables.select.min.js"></script>
        <script type="text/javascript" charset="utf8" src="{$head->baseUrl}/js/javascript/dataTables.buttons.min.js"></script>
        <script src="{$head->baseUrl}/js/javascript/utils.js" type="text/javascript"></script>
        <script src="{$head->baseUrl}/js/javascript/jspdf_1_2_61.debug.js" type="text/javascript"></script>
        <script src="{$head->baseUrl}/js/javascript/jspdf.plugin.autotable_2_0_22.js" type="text/javascript"></script>
        <script src="{$head->baseUrl}/js/javascript/pdf_generator.js"  type="text/javascript"></script>
        <script src="{$head->baseUrl}/js/generator.js"  type="text/javascript"></script>
    </head>
    <body bgcolor="black">
        {include file="com/novaconcept/page/smarty/includes/NavTag.tpl" lang=$lang head=$head view=$view}
        <!--<?php
        // define variables and set to empty values
        $id_demo = $country = $demo_ver = $xml_ver = $size = $demo_link = $xml_link = $title  = "";

        echo "INSIDE PHP !!!\n";
        ?>*/
        <div>
            <img src="{$head->baseUrl}/media/assets/logo-novafr.png" class="gwd-img-ttig">
        </div>-->
        <article class="container">
            <article class="aside">
                {include file="com/novaconcept/page/smarty/includes/Aside.tpl" lang=$lang head=$head view=$view}
            </article>
            <article class="center">
                <div>
                    <p align="center">
                        <img src="{$head->baseUrl}/media/assets/Background_demo_01.jpg" class="div_img">
                    <div align="center" style="margin: 30px auto; padding: 0 50px 0 50px">
                        <div class="filters">
                            <h1>Filtrer les r&eacute;sultats</h1>
                            <div>
                                <table style="width:70%">
                                    <tr>
                                        <th>
                                            ID Quiz:
                                            <select id="filter_quiz_id">
                                                <option value="all">Tous</option>
                                            </select>
                                        </th>
                                        <th>
                                            ID Compagnie:
                                            <select id="filter_corporate_id">
                                                <option value="all">Tous</option>
                                            </select>
                                        </th>
                                        <th>
                                            ID Groupe:
                                            <select id="filter_group_id">
                                                <option value="all">Tous</option>
                                            </select>
                                        </th>
                                        <th>
                                            ID Agence:
                                            <select id="filter_agency_id">
                                                <option value="all">Tous</option>
                                            </select>
                                        </th>
                                        <th>
                                            Progr&egrave;s:
                                            <select id="filter_quiz_progress">
                                                <option value="all">Tous</option>
                                            </select>
                                        </th>
                                    </tr>
                                </table>
                                <p><input type="button" value="Appliquer les filtres" onclick="ApplyFilters();"/></p>
                            </div>
                        </div>
                        <table id="example" class="display" width="100%"></table>
                        <div class="filters">
                            <div>
                                <table style="width:100%">
                                    <tr>
                                        <th>
                                            G&eacute;n&eacute;rer les rapports usagers:
                                            <hr>
                                            <p align="left">Afficher le graphique de r&eacute;sultats <input type="checkbox" id="show_graph" value="show_graph" checked></p>
                                            <p align="left">
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                Graphique r&eacute;sultats - Comparer usager(s) avec:
                                                <select id="user_report_compare">
                                                    <option value="none">Aucun</option>
                                                    <option value="AGENCIES">Agence</option>
                                                    <option value="GROUPS">Groupe</option>
                                                    <option value="CORPORATES">Compagnie</option>
                                                </select>
                                            </p>
                                            <p align="left">Afficher les questions/r&eacute;ponses <input type="checkbox" id="show_answers" value="show_answers" checked> </p>
                                            <p align="left">&nbsp;&nbsp;&nbsp;&nbsp;Afficher les pointages obtenus aux questions<input type="checkbox" id="show_answers_score" value="show_answers_score" checked> </p>
                                            <p align="left">&nbsp;&nbsp;&nbsp;&nbsp;Afficher les meilleures r&eacute;ponses aux questions<input type="checkbox" id="show_best_answers" value="show_best_answers" checked> </p>
                                            <input type="button" value="G&eacute;n&eacute;rer rapport(s) usager(s)" onclick="GenerateUsersReports();" />
                                        </th>
                                        <th>
                                            G&eacute;n&eacute;rer les rapports de participation:
                                            <hr>
                                            <input type="button" value="G&eacute;n&eacute;rer rapport de participation" onclick="GenerateParticipationReport();"/>
                                        </th>
                                    </tr>
                                </table>
                            </div>
                        </div>		
                    </div>
                    </p>
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
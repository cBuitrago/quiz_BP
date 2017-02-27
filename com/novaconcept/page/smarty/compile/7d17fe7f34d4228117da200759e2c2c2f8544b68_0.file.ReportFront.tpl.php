<?php /* Smarty version 3.1.27, created on 2017-02-27 14:40:32
         compiled from "/var/www/html/quiz_panel/com/novaconcept/page/smarty/report_panel/ReportFront.tpl" */ ?>
<?php
/*%%SmartyHeaderCode:95732097258b43a606864d6_88030474%%*/
if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7d17fe7f34d4228117da200759e2c2c2f8544b68' => 
    array (
      0 => '/var/www/html/quiz_panel/com/novaconcept/page/smarty/report_panel/ReportFront.tpl',
      1 => 1487965353,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '95732097258b43a606864d6_88030474',
  'variables' => 
  array (
    'head' => 0,
    'lang' => 0,
    'view' => 0,
  ),
  'has_nocache_code' => false,
  'version' => '3.1.27',
  'unifunc' => 'content_58b43a606dbf38_49730455',
),false);
/*/%%SmartyHeaderCode%%*/
if ($_valid && !is_callable('content_58b43a606dbf38_49730455')) {
function content_58b43a606dbf38_49730455 ($_smarty_tpl) {

$_smarty_tpl->properties['nocache_hash'] = '95732097258b43a606864d6_88030474';
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Novaconcept D&eacute;mo - Mise-&agrave;-jours disponibles</title>
        <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/css/iframe.css">
        <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/css/jquery.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/css/buttons.dataTables.min.css">
        <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/css/select.dataTables.min.css">
        <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/css/font-awesome.min.css">
        <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/css/generator.css">
        <link href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/libs/twitter-bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Roboto:300,400' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/css/main.css">
        <!--<?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/main.js" type="text/javascript"><?php echo '</script'; ?>
>-->
        <!--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.css"/>-->
        <!--<?php echo '<script'; ?>
 type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.js"><?php echo '</script'; ?>
>-->
        <?php echo '<script'; ?>
 type="text/javascript"> baseUrl = "<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
";<?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/javascript/jquery.min.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 type="text/javascript" src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/libs/twitter-bootstrap/js/bootstrap.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 type="text/javascript">var account = <?php if (isset($_SESSION['accountInfo'])) {
echo $_SESSION['accountInfo'];
} else { ?>0<?php }?><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.bundle.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 type="text/javascript" charset="utf8" src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/javascript/jquery.dataTables.min1_10_13.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 type="text/javascript" charset="utf8" src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/javascript/ellipsis.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 type="text/javascript" charset="utf8" src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/javascript/dataTables.select.min.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 type="text/javascript" charset="utf8" src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/javascript/dataTables.buttons.min.js"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/javascript/utils.js" type="text/javascript"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/javascript/jspdf_1_2_61.debug.js" type="text/javascript"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/javascript/jspdf.plugin.autotable_2_0_22.js" type="text/javascript"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/javascript/pdf_generator.js"  type="text/javascript"><?php echo '</script'; ?>
>
        <?php echo '<script'; ?>
 src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/js/generator.js"  type="text/javascript"><?php echo '</script'; ?>
>
    </head>
    <body bgcolor="black">
        <?php echo $_smarty_tpl->getSubTemplate ("com/novaconcept/page/smarty/includes/NavTag.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('lang'=>$_smarty_tpl->tpl_vars['lang']->value,'head'=>$_smarty_tpl->tpl_vars['head']->value,'view'=>$_smarty_tpl->tpl_vars['view']->value), 0);
?>

        <!--<?php echo '<?php
        ';?>// define variables and set to empty values
        $id_demo = $country = $demo_ver = $xml_ver = $size = $demo_link = $xml_link = $title  = "";

        echo "INSIDE PHP !!!\n";
        <?php echo '?>';?>*/
        <div>
            <img src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/media/assets/logo-novafr.png" class="gwd-img-ttig">
        </div>-->
        <article class="container">
            <article class="aside">
                <?php echo $_smarty_tpl->getSubTemplate ("com/novaconcept/page/smarty/includes/Aside.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('lang'=>$_smarty_tpl->tpl_vars['lang']->value,'head'=>$_smarty_tpl->tpl_vars['head']->value,'view'=>$_smarty_tpl->tpl_vars['view']->value), 0);
?>

            </article>
            <article class="center">
                <div>
                    <p align="center">
                        <img src="<?php echo $_smarty_tpl->tpl_vars['head']->value->baseUrl;?>
/media/assets/Background_demo_01.jpg" class="div_img">
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
                <p><?php echo $_smarty_tpl->tpl_vars['lang']->value->includes->footer;?>
</p>
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
</html> <?php }
}
?>
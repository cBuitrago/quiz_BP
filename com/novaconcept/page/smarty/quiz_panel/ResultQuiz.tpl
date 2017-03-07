{if (isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) ||
(isset($view->is_group_admin) && $view->is_group_admin === TRUE) ||
(isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) ||
(isset($view->is_user) && $view->is_user === TRUE)
}

<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">

        <!--<title><?php echo "quiz TITLE";?>BP - QUIZ VALIDATION</title>-->

        <link href="{$head->baseUrl}/css/animate.css" rel="stylesheet">
        <link href="{$head->baseUrl}/css/style.css" rel="stylesheet">
        <link href="{$head->baseUrl}/css/awesome-bootstrap-checkbox.css" rel="stylesheet">
        <link href="{$head->baseUrl}/js/libs/twitter-bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Roboto:300,400' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="{$head->baseUrl}/css/main.css">
        <script type="text/javascript"> baseUrl = "{$head->baseUrl}";</script>
        <script type="text/javascript">var account = {if isset($smarty.session.accountInfo)}{$smarty.session.accountInfo}{else}0{/if}</script>
        <script src="{$head->baseUrl}/js/libs/jquery/jquery.js" type="text/javascript"></script>
        <script type="text/javascript" src="{$head->baseUrl}/js/libs/twitter-bootstrap/js/bootstrap.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.bundle.js"></script>
        <script src="{$head->baseUrl}/js/javascript/jspdf_1_2_61.debug.js" type="text/javascript"></script>
        <script src="{$head->baseUrl}/js/javascript/jspdf.plugin.autotable_2_0_22.js" type="text/javascript"></script>
        <script src="{$head->baseUrl}/js/utils.js"></script>
        <script src="{$head->baseUrl}/js/javascript/utils.js"></script>
        <script src="{$head->baseUrl}/js/javascript/jquery.simple.timer.js"></script>
        <script src="{$head->baseUrl}/js/javascript/pdf_generator.js"  type="text/javascript"></script>
        <script src="{$head->baseUrl}/js/main.js"  type="text/javascript"></script>

        <style>
            canvas {
                -moz-user-select: none;
                -webkit-user-select: none;
                -ms-user-select: none;
            }
        </style>
    </head>
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
                    <li><a href="{$head->baseUrl}/profile">Profile</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="{$head->baseUrl}/logout">{$lang->includes->logOut}</a></li>
                </ul>
            </div>
        </nav>
        <article class="container">
            <article class="aside">
                {include file="com/novaconcept/page/smarty/includes/Aside.tpl" lang=$lang head=$head view=$view}
            </article>
            <article class="center">
                <h2 style='text-align:left;' >{$data->quizData->pageTitle}</h2>
                {if ( isset($data->RESULT_PROGRESS_ID) && $data->RESULT_PROGRESS_ID == 3 )}
                    <form id='quizResultsSelf'>
                        <input type="hidden" name='idQuiz' value="{$data->ID}">
                        <button type="button" class="edit" id="onUserResult" 
                                data-toggle="tooltip" data-placement="left" title="userResult">
                            Telecharger resultats PDF
                        </button>
                    </form>
                {/if}
                {if ( isset($data->RESULT_PROGRESS_ID) && $data->RESULT_PROGRESS_ID == 2 )}
                    <h3>Vous avez pas bien fini votre Quiz</h3>
                {/if}
            </article>
        </article>
        <footer>
            <div class="footer">
                <p>{$lang->includes->footer}</p>
            </div>
        </footer>
    </body>
</html>
{/if}


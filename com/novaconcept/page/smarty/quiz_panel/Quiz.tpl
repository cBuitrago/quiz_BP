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

        <script src="{$head->baseUrl}/js/libs/jquery/jquery.js" type="text/javascript"></script>
        <script type="text/javascript" src="{$head->baseUrl}/js/libs/twitter-bootstrap/js/bootstrap.js"></script>
        <script src="{$head->baseUrl}/js/utils.js"></script>
        <script src="{$head->baseUrl}/js/javascript/jquery.simple.timer.js"></script>
        <script src="{$head->baseUrl}/js/quiz.js"  type="text/javascript"></script>
        <script type="text/javascript"> baseUrl = "{$head->baseUrl}";</script>
        <script type="text/javascript">var account = {if isset($smarty.session.accountInfo)}{$smarty.session.accountInfo}{else}0{/if}</script>

        <!--<script src="{$head->baseUrl}/js/main.js" type="text/javascript"></script>-->
        <!--<script  src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>-->
        <!--<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>-->
        <!--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.css"/>-->
        <!--<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.13/datatables.min.js"></script>-->
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
                <img src="/quiz_panel/media/images/logo-cfc-fr.jpeg">
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
            <div id="pageTitle">
                <h2 style='text-align:left;' >{$data->quizData->pageTitle}</h2>
            </div>
            <div class='container-fluid' id='quiz'>
                <div id="quiz-carousel" class="carousel slide" data-ride="carousel">
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        {assign var="secc" value=0}
                        {foreach from=$data->quizData->section item=article}
                            {assign var="quest" value=0}
                            <div class="item {if $secc == 0}active{/if}" data-slide-value='{$secc}'>
                                <div id='rectangle' style="background-color:rgb({$article->color->red},{$article->color->green},{$article->color->blue})"></div>
                                <div class ='row'>
                                    <div class='col-md-12 helper_height'  id='section_{$secc}' >
                                        <form id='myForm_{$secc}' class='moving-row' > 
                                            <h2>
                                                <small style="color:rgb('{$article->color->red},{$article->color->green},{$article->color->blue}'">{$article->sectionTitle}</small>
                                            </h2>
                                            {foreach from=$article->question item=question}
                                                {assign var="ans" value=0}
                                                <fieldset id= 'question_{$quest}' required> <p><b>{$question->questionTitle}</p></b>
                                                    {foreach from=$question->answer item=answer}
                                                        <div class='radio radio-info'>
                                                            <input type='radio' value='s{$secc}q{$quest}a{$ans}' id='s{$secc}q{$quest}a{$ans}' name='question_{$quest}' required>
                                                            <label for='s{$secc}q{$quest}a{$ans}' >{$answer->answerText}</label></br>
                                                        </div>
                                                        {assign var="ans" value=$ans+1}
                                                    {/foreach}
                                                </fieldset>
                                                {assign var="quest" value=$quest+1}
                                            {/foreach}
                                        </form>
                                    </div>
                                </div>
                                {assign var="secc" value=$secc+1}
                            </div>
                        {/foreach}

                    </div>
                        <input type="hidden" id='quiz_name' value="{$data->QUIZ_ID}">
                    <a class="left carousel-control hidden" href="#quiz-carousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control hidden" href="#quiz-carousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </article>
        <div id="footer" >  
            <a class="" href="#" role="button" id="previousSection">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="" href="#" role="button"  id='nextSection'>
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>


            <!-- Controls 
            <a class="left carousel-control" href="#quiz-carousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#quiz-carousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>-->
            <!--<div class="row">
                <div class="col-xs-3 text-left">
                    <div id ="previousButton"> 
                        <a  href="#" onclick="previousForm();">	&#60; &nbsp&nbsp Previous</a> 
                    </div> 
                </div>
                <div class="col-xs-6">
            <!--<div id="timerPlacement"> Il vous reste 
                <b><span class="timer inline" data-seconds-left= <?php echo $_SESSION['quizData'][0][5]; ?>></span></b>
            </div>
        </div>		
        <div class="col-xs-3 text-right">
            <div id="nextButton">  
                <a  href="#" onclick="submitForm();"> Next&nbsp &nbsp></a> 
            </div>
        </div>
    </div>-->
        </div>
        <footer>
            <div class="footer">
                <p>{$lang->includes->footer}</p>
            </div>
        </footer>
    </body>
</html>
{/if}


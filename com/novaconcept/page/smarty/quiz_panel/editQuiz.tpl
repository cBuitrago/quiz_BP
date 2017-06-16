{if (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) }
    <div>
        <ul class="nav nav-tabs" role="tablist">
            <p>Éditer {$data->QUIZ_ID}</p>
        </ul>
    </div>
    <form id="edit_quiz_form" action="{$smarty.server.REQUEST_URI}" method="post">
        <div class="containerEdit">
            <input type="hidden" name="ID" id="ID" value="{$data->ID}" >
            <div class="single-input">
                <label for="QUIZ_ID">Nom du quiz</label>
                <input type="text" name="QUIZ_ID" id="QUIZ_ID" value="{$data->QUIZ_ID}" >
            </div>
            <div class="single-input">
                <label for="TIME_TO_COMPLETE">Temps aloué ( secondes )</label>
                <input type="text" name="TIME_TO_COMPLETE" id="TIME_TO_COMPLETE" value="{$data->TIME_TO_COMPLETE}">
            </div>
            <div class="single-input">
                <label for="QUIZ_DATA">Données du quiz</label>
                <!--<textarea name="QUIZ_DATA" id="QUIZ_DATA">$data->QUIZ_DATA}</textarea>-->
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#editDataQuiz">
                    Commencer
                </button>
            </div>
            <div class="single-input">
                <input type="checkbox" name="LOCKED_ON_COMPLETION" id="LOCKED_ON_COMPLETION" 
                       value=1 {if $data->LOCKED_ON_COMPLETION == true}checked {/if}>
                <label for="LOCKED_ON_COMPLETION" >Vérouillé lorsque complété</label>
            </div>
            <div class="single-input">
                <input type="checkbox" name="IS_USER_CAN_DISPLAY_CHART" id="IS_USER_CAN_DISPLAY_CHART" 
                       value=1 {if $data->IS_USER_CAN_DISPLAY_CHART == true}checked {/if}>
                <label for="IS_USER_CAN_DISPLAY_CHART">Rapport avec graphique de résultat</label>
            </div>
            <div class="single-input">
                <input type="checkbox" name="IS_USER_CAN_DISPLAY_QA" id="IS_USER_CAN_DISPLAY_QA" 
                       value=1 {if $data->IS_USER_CAN_DISPLAY_QA == true}checked {/if}>
                <label for="IS_USER_CAN_DISPLAY_QA">Rapport avec questions/réponses</label>
            </div>
            <div class="single-input">
                <input type="checkbox" name="IS_ENABLED" id="IS_ENABLED" 
                       value=1 {if $data->IS_ENABLED == true}checked {/if}>
                <label for="IS_ENABLED">Quiz actif</label>
            </div>
            <div class="single-input">
                <input type="checkbox" name="IS_USER_SEE_GOOD_ANSWER" id="IS_USER_SEE_GOOD_ANSWER" 
                       value=1 {if $data->IS_USER_SEE_GOOD_ANSWER == true}checked {/if}>
                <label for="IS_USER_SEE_GOOD_ANSWER">Rapport avec visualisation des bonnes réponses</label>
            </div>
            <h1>Gestion des Agences</h1>
            <div>
                {foreach from=$data->agencies item=agency}
                    <div class="single-input">
                        <input type="checkbox" id="agency_{$agency->id}" name="AGENCY_QUIZ[]" 
                               value="{$agency->id}" {if isset($agency->quizAuthorization) && $agency->quizAuthorization == true }checked {/if}>
                        <label for="agency_{$agency->id}"> {$agency->name}</label>
                    </div>
                {/foreach}
            </div>
            <div>
                <button type="submit" class="nv-btn-default nv-principal-color" id="onEditQuiz" 
                        data-toggle="tooltip" data-placement="left" title="ajouter quiz">
                    Éditer Quiz
                </button>
            </div>
        </div>
    </form>
    <div class="modal" id="editDataQuiz" tabindex="-1" role="dialog" >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span >&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Données du quiz</h4>
                </div>
                <div class="modal-body">
                    <div class="panel-group" id="accordion" role="tablist" >
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" >
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse" >
                                        Titre du Quiz
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body">
                                    <div class="single-input">
                                        <label for="QUIZ_TITLE">Titre du quiz</label>
                                        <input type="text" name="QUIZ_TITLE" id="QUIZ_TITLE" value="{$data->QUIZ_DATA->pageTitle}" >
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary js_quizTitle" data-collapse="1" >next</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {assign var=current_item value=1}
                        {foreach from=$data->QUIZ_DATA->section item=sectionItem}
                            <div class="panel panel-default js_section">
                                <div class="panel-heading" role="tab">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse_{$current_item}" >
                                            Section {$current_item} : 
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse_{$current_item}" class="panel-collapse collapse" role="tabpanel" >
                                    <div class="panel-body">
                                        <div class="single-input">
                                            <label for="QUIZ_SECTION_TITLE_{$current_item}">Titre de la section</label>
                                            <button type="button" class="btn btn-default btn-prev js_delete_section">Effacer Section</button>
                                            <input type="text" name="QUIZ_SECTION_TITLE" id="QUIZ_SECTION_TITLE_{$current_item}" value="{$sectionItem->sectionTitle|escape:'htmlall'}">
                                        </div>
                                        <div id="color_{$current_item}" class="input-group colorpicker-component js_color_picker">
                                            <input type="text" value="rgb({$sectionItem->color->red},{$sectionItem->color->green},{$sectionItem->color->blue})" 
                                                   class="form-control" name="js_color_section" />
                                            <span class="input-group-addon"><i></i></span>
                                            <script>
                                                {literal}
                                                    $(function () {
                                                        $('#color_{/literal}{$current_item}{literal}').colorpicker({
                                                            color: 'rgb({/literal}{$sectionItem->color->red},{$sectionItem->color->green},{$sectionItem->color->blue}{literal})',
                                                            format: 'rgb'
                                                        });
                                                    });
                                                {/literal}
                                            </script>
                                        </div>
                                        <div class="question" id="question_">
                                            <div class="question_head">
                                                <p>Question</p>
                                                <button type="button" class="btn btn-default btn-prev js_add_question">ajouter question</button>
                                            </div>
                                            {assign var=current_question value=1}
                                            {foreach from=$sectionItem->question item=questionItem}
                                                <div class="question_body">
                                                    <div class="input-group">
                                                        <input type="text" class="js_curr_question" value="{$current_question}." disabled="disabled">
                                                        <input type="text" name="QUIZ_QUESTION_TITLE" value="{$questionItem->questionTitle|escape:'htmlall'}">
                                                        <span class="input-group-addon glyphicon glyphicon-remove btn-span js_delete_question"></span>
                                                    </div>
                                                    <div class="answer">
                                                        <div class="answer-head">
                                                            <p class="p_title">Reponses</p>
                                                            <button type="button" class="btn btn-default btn-prev btn_add js_add_answer">ajouter answer</button>
                                                            <p class="score">score</p>
                                                        </div>
                                                        {assign var=current_answer value=0}
                                                        {foreach from=$questionItem->answer item=answerItem}
                                                            <div class="item">
                                                                <div class="input-group">
                                                                    <input type="text" class="js_curr_answer" value="{$data->ALPHABET|substr:$current_answer:1}." disabled="disabled">
                                                                    <input type="text" name="QUIZ_ANSWER_TITLE" value="{$answerItem->answerText|escape:'htmlall'}">
                                                                    <input type="number" name="QUIZ_ANSWER_SCORE" value="{$data->ANSWER_JSON[$current_item-1][$current_question-1][$current_answer]}">
                                                                    <span class="input-group-addon glyphicon glyphicon-remove btn-span js_delete_answer"></span>
                                                                </div>
                                                            </div>
                                                            {assign var=current_answer value=$current_answer+1}
                                                        {/foreach}
                                                    </div>
                                                </div>
                                                {assign var=current_question value=$current_question+1}
                                            {/foreach}
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary js_add_section" data-collapse="{$current_item}">next</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {assign var=current_item value=$current_item+1}
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    </div>
{/if}
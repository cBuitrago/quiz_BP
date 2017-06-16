{if (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) }
    <div>
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" >
                <a href="{$head->baseUrl}/{$smarty.session.accountInfo}/quiz" >Quiz List</a>
            </li>
            <li role="presentation" >
                <a href="{$head->baseUrl}/{$smarty.session.accountInfo}/quiz#manageQuizTablist" >Gestion des Quiz</a>
            </li>
            {if (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) }
                <li role="presentation" class="active" aria-controls="home" role="tab" data-toggle="tab">
                    <a href="">Ajouter Quiz</a>
                </li>
            {/if}
        </ul>
    </div>
    <form id="add_quiz_form">
        <div class="containerEdit">
            <div class="single-input">
                <label for="QUIZ_ID">Nom du quiz</label>
                <input type="text" name="QUIZ_ID" id="QUIZ_ID" >
            </div>
            <div class="single-input">
                <label for="TIME_TO_COMPLETE">TIME_TO_COMPLETE</label>
                <input type="text" name="TIME_TO_COMPLETE" id="TIME_TO_COMPLETE" >
            </div>
            <div class="single-input">
                <label for="QUIZ_DATA">Données du quiz</label>
                <!--<textarea name="QUIZ_DATA" id="QUIZ_DATA"></textarea>-->
                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#startDtaQuiz">
                    Commencer
                </button>
            </div>
            <div class="single-input">
                <input type="checkbox" name="LOCKED_ON_COMPLETION" id="LOCKED_ON_COMPLETION" >
                <label for="LOCKED_ON_COMPLETION">LOCKED_ON_COMPLETION</label>
            </div>
            <div class="single-input">
                <input type="checkbox" name="IS_USER_CAN_DISPLAY_CHART" id="IS_USER_CAN_DISPLAY_CHART" >
                <label for="IS_USER_CAN_DISPLAY_CHART">IS_USER_CAN_DISPLAY_CHART</label>
            </div>
            <div class="single-input">
                <input type="checkbox" name="IS_USER_CAN_DISPLAY_QA" id="IS_USER_CAN_DISPLAY_QA" >
                <label for="IS_USER_CAN_DISPLAY_QA">IS_USER_CAN_DISPLAY_QA</label>
            </div>
            <div class="single-input">
                <input type="checkbox" name="IS_ENABLED" id="IS_ENABLED" >
                <label for="IS_ENABLED">IS_ENABLED</label>
            </div>
            <div class="single-input">
                <input type="checkbox" name="IS_USER_SEE_GOOD_ANSWER" id="IS_USER_SEE_GOOD_ANSWER" >
                <label for="IS_USER_SEE_GOOD_ANSWER">IS_USER_SEE_GOOD_ANSWER</label>
            </div>
            <div class="single-input">
                <label for="ANSWER_JSON">ANSWER_JSON</label>
                <textarea name="ANSWER_JSON" id="ANSWER_JSON"></textarea>
            </div>
            <h1>Ajouter Agences</h1>
            <div>
                {foreach from=$data item=agency}
                    <div class="single-input">
                        <input type="checkbox" id="agency_{$agency->id}" name="agency_quiz" value="{$agency->id}" >
                        <label for="agency_{$agency->id}"> {$agency->name}</label>
                    </div>
                {/foreach}
            </div>
            <div>
                <button type="button" class="nv-btn-default nv-principal-color" id="onAddQuiz" 
                        data-toggle="tooltip" data-placement="left" title="ajouter quiz">
                    Ajouter Quiz
                </button>
            </div>
        </div>
    </form>
    <div class="modal fade" id="startDtaQuiz" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Données du quiz</h4>
                </div>
                <div class="modal-body">
                    <div class="single-input">
                        <label for="QUIZ_TITLE">Titre du quiz</label>
                        <input type="text" name="QUIZ_TITLE" id="QUIZ_ID" >
                    </div>
                    <div id="cp3" class="input-group colorpicker-component">
                        <input type="text" value="#00AABB" class="form-control" />
                        <span class="input-group-addon"><i></i></span>
                    </div>
                    <script>
                        $(function () {
                            $('#cp3').colorpicker({
                                color: '#AA3399',
                                format: 'rgb'
                            });
                        });
                    </script>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
{/if}
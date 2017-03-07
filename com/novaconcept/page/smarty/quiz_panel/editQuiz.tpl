{if (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) }
    <div>
        <ul class="nav nav-tabs" role="tablist">
            <p>Editer {$data->QUIZ_ID}</p>
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
                <label for="TIME_TO_COMPLETE">TIME_TO_COMPLETE</label>
                <input type="text" name="TIME_TO_COMPLETE" id="TIME_TO_COMPLETE" value="{$data->TIME_TO_COMPLETE}">
            </div>
            <div class="single-input">
                <label for="QUIZ_DATA">QUIZ_DATA</label>
                <textarea name="QUIZ_DATA" id="QUIZ_DATA">{$data->QUIZ_DATA}</textarea>
            </div>
            <div class="single-input">
                <input type="checkbox" name="LOCKED_ON_COMPLETION" id="LOCKED_ON_COMPLETION" 
                       value=1 {if $data->LOCKED_ON_COMPLETION == true}checked {/if}>
                <label for="LOCKED_ON_COMPLETION" >LOCKED_ON_COMPLETION</label>
            </div>
            <div class="single-input">
                <input type="checkbox" name="IS_USER_CAN_DISPLAY_CHART" id="IS_USER_CAN_DISPLAY_CHART" 
                       value=1 {if $data->IS_USER_CAN_DISPLAY_CHART == true}checked {/if}>
                <label for="IS_USER_CAN_DISPLAY_CHART">IS_USER_CAN_DISPLAY_CHART</label>
            </div>
            <div class="single-input">
                <input type="checkbox" name="IS_USER_CAN_DISPLAY_QA" id="IS_USER_CAN_DISPLAY_QA" 
                       value=1 {if $data->IS_USER_CAN_DISPLAY_QA == true}checked {/if}>
                <label for="IS_USER_CAN_DISPLAY_QA">IS_USER_CAN_DISPLAY_QA</label>
            </div>
            <div class="single-input">
                <input type="checkbox" name="IS_ENABLED" id="IS_ENABLED" 
                       value=1 {if $data->IS_ENABLED == true}checked {/if}>
                <label for="IS_ENABLED">IS_ENABLED</label>
            </div>
            <div class="single-input">
                <input type="checkbox" name="IS_USER_SEE_GOOD_ANSWER" id="IS_USER_SEE_GOOD_ANSWER" 
                       value=1 {if $data->IS_USER_SEE_GOOD_ANSWER == true}checked {/if}>
                <label for="IS_USER_SEE_GOOD_ANSWER">IS_USER_SEE_GOOD_ANSWER</label>
            </div>
            <div class="single-input">
                <label for="ANSWER_JSON">ANSWER_JSON</label>
                <textarea name="ANSWER_JSON" id="ANSWER_JSON">{$data->ANSWER_JSON}</textarea>
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
                <button type="submit" class="edit" id="onEditQuiz" 
                        data-toggle="tooltip" data-placement="left" title="ajouter quiz">
                    Éditer Quiz
                </button>
            </div>
    </form>
{/if}
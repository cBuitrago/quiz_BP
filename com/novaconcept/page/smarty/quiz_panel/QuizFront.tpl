<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active" >
        <a href="#manageUserTablist" aria-controls="home" role="tab" data-toggle="tab" >Liste de quiz</a>
    </li>
    {if (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) }
        <li role="presentation">
            <a href="#manageQuizTablist" aria-controls="home" role="tab" data-toggle="tab" >Gestion des quiz</a>
        </li>
        <li role="presentation">
            <a href="#addQuiz" aria-controls="home" role="tab" data-toggle="tab">Ajouter Quiz</a>
        </li>
    {/if}
</ul>


{if (isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) ||
(isset($view->is_group_admin) && $view->is_group_admin === TRUE) ||
(isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) ||
(isset($view->is_user) && $view->is_user === TRUE)
}
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="manageUserTablist">
        <div class="dataTables_wrapper no-border">
            <table class="display dataTable no-footer">
                <thead>
                    <tr>
                        <th>
                            #
                        </th>
                        <th>
                            Nom du quiz
                        </th>
                        <th>
                            Présenter le quiz
                        </th>
                        <th>
                            Résultats du quiz
                        </th>
                    </tr>
                </thead>
                <tbody>
                    {assign var="id" value=0}
                    {foreach from=$data->agency item=quiz}
                        {assign var="id" value=$id+1}
                        <tr>
                            <td>
                                {$id}
                            </td>
                            <td>{$quiz->QUIZ_ID}</td>
                            <td>
                                {if ! isset($quiz->RESULT) }
                                    <a class="view" href="{$head->baseUrl}/{$smarty.session.accountInfo}/quiz/{$quiz->ID}"
                                       data-toggle="tooltip" data-placement="left" title="info de l'utilisateur">
                                        aller
                                    </a>
                                {/if}
                            </td>
                            <td>
                                {if isset($quiz->RESULT) }
                                    <a class="view" href="{$head->baseUrl}/{$smarty.session.accountInfo}/results/{$quiz->ID}"
                                       data-toggle="tooltip" data-placement="left" title="info de l'utilisateur">
                                        Consulter
                                    </a>
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>
    {if (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) }         
        <div role="tabpanel" class="tab-pane" id="manageQuizTablist">
            <div class="dataTables_wrapper no-border">
                <table class="display dataTable no-footer">
                    <thead>
                        <tr>
                            <th>
                                #
                            </th>
                            <th>
                                Nom du quiz
                            </th>
                            <th>
                                Éditer
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {assign var="id" value=0}
                        {foreach from=$data->all item=quiz}
                            {assign var="id" value=$id+1}
                            <tr>
                                <td>
                                    {$id}
                                </td>
                                <td>{$quiz->QUIZ_ID}</td>
                                <td>
                                    <a class="view" href="{$head->baseUrl}/{$smarty.session.accountInfo}/quiz/{$quiz->ID}/edit"
                                       data-toggle="tooltip" data-placement="left" title="info de l'utilisateur">
                                        Éditer
                                    </a>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane" id="addQuiz">
            <form id="add_quiz_form">
                <div class="containerEdit">
                    <div class="single-input">
                        <label for="QUIZ_ID">Nom du quiz</label>
                        <input type="text" name="QUIZ_ID" id="QUIZ_ID" >
                    </div>
                    <div class="single-input">
                        <label for="TIME_TO_COMPLETE">Temps aloué ( secondes )</label>
                        <input type="text" name="TIME_TO_COMPLETE" id="TIME_TO_COMPLETE" >
                    </div>
                    <div class="single-input">
                        <label for="QUIZ_DATA">Données du quiz</label>
                        <textarea name="QUIZ_DATA" id="QUIZ_DATA"></textarea>
                    </div>
                    <div class="single-input">
                        <input type="checkbox" name="LOCKED_ON_COMPLETION" id="LOCKED_ON_COMPLETION" >
                        <label for="LOCKED_ON_COMPLETION">Vérouillé lorsque complété</label>
                    </div>
                    <div class="single-input">
                        <input type="checkbox" name="IS_USER_CAN_DISPLAY_CHART" id="IS_USER_CAN_DISPLAY_CHART" >
                        <label for="IS_USER_CAN_DISPLAY_CHART">Rapport avec graphique de résultat</label>
                    </div>
                    <div class="single-input">
                        <input type="checkbox" name="IS_USER_CAN_DISPLAY_QA" id="IS_USER_CAN_DISPLAY_QA" >
                        <label for="IS_USER_CAN_DISPLAY_QA">Rapport avec questions/réponses</label>
                    </div>
                    <div class="single-input">
                        <input type="checkbox" name="IS_ENABLED" id="IS_ENABLED" >
                        <label for="IS_ENABLED">Quiz actif</label>
                    </div>
                    <div class="single-input">
                        <input type="checkbox" name="IS_USER_SEE_GOOD_ANSWER" id="IS_USER_SEE_GOOD_ANSWER" >
                        <label for="IS_USER_SEE_GOOD_ANSWER">Rapport avec visualisation des bonnes réponses</label>
                    </div>
                    <div class="single-input">
                        <label for="ANSWER_JSON">Résponses</label>
                        <textarea name="ANSWER_JSON" id="ANSWER_JSON"></textarea>
                    </div>
                    <h1>Ajouter Agences</h1>
                    <div>
                        {foreach from=$data->agencies item=agency}
                            <div class="single-input">
                                <input type="checkbox" id="agency_{$agency->id}" name="agency_quiz" value="{$agency->id}" >
                                <label for="agency_{$agency->id}"> {$agency->name}</label>
                            </div>
                        {/foreach}
                    </div>
                    <div>
                        <button type="button" class="edit" id="onAddQuiz" 
                                data-toggle="tooltip" data-placement="left" title="ajouter quiz">
                            Ajouter Quiz
                        </button>
                    </div>
            </form>
        </div>
    {/if}
</div>
{/if}
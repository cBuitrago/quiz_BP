{if (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) }
    <form id="add_quiz_form">
        <table>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <label for="QUIZ_ID">Nom du quiz</label>
                            </td>
                            <td>
                                <input type="text" name="QUIZ_ID" id="QUIZ_ID" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="LOCKED_ON_COMPLETION">LOCKED_ON_COMPLETION</label>
                            </td>
                            <td>
                                <input type="checkbox" name="LOCKED_ON_COMPLETION" id="LOCKED_ON_COMPLETION" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="TIME_TO_COMPLETE">TIME_TO_COMPLETE</label>
                            </td>
                            <td>
                                <input type="text" name="TIME_TO_COMPLETE" id="TIME_TO_COMPLETE" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="QUIZ_DATA">QUIZ_DATA</label>
                            </td>
                            <td>
                                <textarea name="QUIZ_DATA" id="QUIZ_DATA"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="IS_USER_CAN_DISPLAY_CHART">IS_USER_CAN_DISPLAY_CHART</label>
                            </td>
                            <td>
                                <input type="checkbox" name="IS_USER_CAN_DISPLAY_CHART" id="IS_USER_CAN_DISPLAY_CHART" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="IS_USER_CAN_DISPLAY_QA">IS_USER_CAN_DISPLAY_QA</label>
                            </td>
                            <td>
                                <input type="checkbox" name="IS_USER_CAN_DISPLAY_QA" id="IS_USER_CAN_DISPLAY_QA" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="IS_ENABLED">IS_ENABLED</label>
                            </td>
                            <td>
                                <input type="checkbox" name="IS_ENABLED" id="IS_ENABLED" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="IS_USER_SEE_GOOD_ANSWER">IS_USER_SEE_GOOD_ANSWER</label>
                            </td>
                            <td>
                                <input type="checkbox" name="IS_USER_SEE_GOOD_ANSWER" id="IS_USER_SEE_GOOD_ANSWER" >
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="ANSWER_JSON">ANSWER_JSON</label>
                            </td>
                            <td>
                                <textarea name="ANSWER_JSON" id="ANSWER_JSON"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Agences : 
                            </td>
                            <td>
                                {foreach from=$data item=agency}
                                    <input type="checkbox" id="agency_{$agency->id}" name="agency_quiz" value="{$agency->id}" >
                                    <label for="agency_{$agency->id}"> {$agency->name}</label><br/>
                                {/foreach}
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <button type="button" class="edit" id="onAddQuiz" 
                            data-toggle="tooltip" data-placement="left" title="ajouter quiz">
                        <span class="glyphicon glyphicon-plus"></span>
                    </button>
                </td>
            </tr>
        </table>
    </form>
{/if}
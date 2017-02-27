{if (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) }
    <table>
        <tr>
            <td>
                <h1>Ajouter Quiz</h1>
            </td>
            <td>
                <a class="edit" href="{$head->baseUrl}/{$smarty.session.accountInfo}/add/quiz"
                   data-toggle="tooltip" data-placement="left" title="info de l'utilisateur">
                    <span class="glyphicon glyphicon-plus"></span>
                </a>
            </td>
        </tr>
    </table>
{/if}

{if (isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) ||
(isset($view->is_group_admin) && $view->is_group_admin === TRUE) ||
(isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) ||
(isset($view->is_user) && $view->is_user === TRUE)
}
<h1>Quiz List</h1>

<table class="table table-striped">
    <tr>
        <td>
            #
        </td>
        <td>
            Quiz
        </td>
        <td>
            Go!
        </td>
        <td>
            Résultats
        </td>
    </tr>
    {assign var="id" value=0}
    {foreach from=$data item=quiz}
        {assign var="id" value=$id+1}
        <tr>
            <td>
                {$id}
            </td>
            <td>{$quiz->QUIZ_ID}</td>
            <td>
                <a class="edit" href="{$head->baseUrl}/{$smarty.session.accountInfo}/quiz/{$quiz->ID}"
                   data-toggle="tooltip" data-placement="left" title="info de l'utilisateur">
                    <span class="glyphicon glyphicon-pencil"></span>
                </a>
            </td>
            <td>
                {if $quiz->IS_USER_CAN_DISPLAY_QA}
                    <a class="edit" href="{$head->baseUrl}/{$smarty.session.accountInfo}/quiz/{$quiz->ID}"
                       data-toggle="tooltip" data-placement="left" title="info de l'utilisateur">
                        <span class="glyphicon glyphicon-pencil"></span>
                    </a>
                {/if}
            </td>
        </tr>
    {/foreach}
</table>
{/if}
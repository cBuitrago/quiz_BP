<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active">
        <a href="#infoGroup" aria-controls="home" role="tab" data-toggle="tab">Quiz List</a>
    </li>
    {if (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) }
        <li role="presentation">
            <a href="{$head->baseUrl}/{$smarty.session.accountInfo}/add/quiz">Ajouter Quiz</a>
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
                            NUMERO #
                        </th>
                        <th>
                            NOM DU QUIZ
                        </th>
                        <th>
                            PRESENTER LE QUIZ
                        </th>
                        <th>
                            RESULTATS DU QUIZ
                        </th>
                    </tr>
                </thead>
                <tbody>
                    {assign var="id" value=0}
                    {foreach from=$data item=quiz}
                        {assign var="id" value=$id+1}
                        <tr>
                            <td>
                                {$id}
                            </td>
                            <td>{$quiz->QUIZ_ID}</td>
                            <td>
                                <a class="view" href="{$head->baseUrl}/{$smarty.session.accountInfo}/quiz/{$quiz->ID}"
                                   data-toggle="tooltip" data-placement="left" title="info de l'utilisateur">
                                    aller
                                </a>
                            </td>
                            <td>
                                {if $quiz->IS_USER_CAN_DISPLAY_QA}
                                    <a class="view" href="{$head->baseUrl}/{$smarty.session.accountInfo}/quiz/{$quiz->ID}"
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
</div>
{/if}
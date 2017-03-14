<h1>{$lang->user->find}</h1>
<form id="find_user_form">
    <table>
        <tr><td><label for="email">{$lang->user->email}</label></td><td><input type="text" name="email" id="email"></td></tr>
        <tr><td><label for="page_per">{$lang->includes->results}</label></td><td><select name="page_per" id="page_per">
                    <option value="20">20</option>
                    <option value="25">25</option>
                    <option value="50">50</option>
                    <option value="100">100</option>
                </select></td>
        </tr>
    </table>
    <input type="text" name="page" value="0" {if isset($data)}hidden{/if}><br>
    <button type="button" class="find" id="onUserFind">{$lang->user->find}</button>
</form>
{if isset($data)}
    <table>
        {foreach from=$data item=user}
            <tr>
                <td>{$user->email}</label></td>
                <td><a class="edit" href="{$head->baseUrl}/{$smarty.session.accountInfo}/user/{$user->id}/edit">{$lang->user->edit}</a></td>
                    {if isset($view->manage_departments) && $view->manage_departments === TRUE}
                    <td><a class="get" href="{$head->baseUrl}/{$smarty.session.accountInfo}/user/{$user->id}/edit/department">{$lang->user->departments}</a></td>
                    {/if}
            </tr>
        {/foreach}
    </table>
{/if}   

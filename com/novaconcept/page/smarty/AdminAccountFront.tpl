<h1>{$smarty.session.accountName}</h1>
<nav class="nav-admin">   
    <ul>
        {if isset($view->manage_departments) && $view->manage_departments === TRUE}
        <li><a href="{$head->baseUrl}/{$smarty.session.accountInfo}/department">{$lang->includes->department}</a></li>
        {/if}
        {if isset($view->manage_users) && $view->manage_users === TRUE}
        <li><a href="{$head->baseUrl}/{$smarty.session.accountInfo}/user">{$lang->includes->user}</a></li>
        {/if}
    </ul>
</nav>
<form id="test_form">
    <input type="hidden" name="id" id="idUser" value="{$smarty.session.userInfo->id}">
    <button type="button" class="save" id="test">TEST APPELS</button>
</form>
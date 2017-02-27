<h1>{$lang->user->titleDepartments}</h1>
<h2>{$data->email}</h2>
<form id='edit_user_password_form'>
    <input type="hidden" name='user_id' value='{$data->id}'>
    {if !empty($data->departments)}
        {include file="com/novaconcept/page/smarty/includes/DepartmentUserTree.tpl" data=$data->departments lang=$lang head=$head}
    {/if}
    <button type='button' class="save" id='onUserEditDepartment'>{$lang->user->edit}</button>
</form>
<script>var authorizations = {json_encode($data->authorizations)}</script>

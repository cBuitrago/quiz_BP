<!--<table id="dataTable" class="display" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>#</th>
            <th>Username</th>
            <th>Info</th>
        </tr>
    </thead>
    <tbody>
{assign var="id" value=0}
{foreach from=$data item=user}
    {assign var="id" value=$id+1}
    <tr>
        <td>{$id}</td>
        <td>{$user->username}</td>
        <td>
            <a class="edit" href="{$head->baseUrl}/{$smarty.session.accountInfo}/user/{$user->id}/edit"
               data-toggle="tooltip" data-placement="left" title="info de l'utilisateur">
                <span class="glyphicon glyphicon-pencil"></span>
            </a>
        </td>
    </tr>
{/foreach}
</tbody>
</table>-->

<!--<script>var tableData = {json_encode($data)}</script>-->
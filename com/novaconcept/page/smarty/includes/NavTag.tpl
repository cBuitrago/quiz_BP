<nav class="head">
    <div class="image">
        <img src="{$head->baseUrl}/media/images/{$smarty.session.accountLogo}">
    </div>
    <div class="dropdown">
        <button class="dropdown-toggle" type="button" id="profile-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
            {$smarty.session.userInfo->firstName} {$smarty.session.userInfo->name}
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" aria-labelledby="profile-dropdown">
            <li><a href="{$head->baseUrl}/profile">Profil</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="{$head->baseUrl}/logout">{$lang->includes->logOut}</a></li>
        </ul>
    </div>
</nav>
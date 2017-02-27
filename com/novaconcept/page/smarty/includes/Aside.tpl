<ul>
    {if (isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) ||
        (isset($view->is_group_admin) && $view->is_group_admin === TRUE) ||
        (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE)
    }
    <li>
        <a href="{$head->baseUrl}/{$smarty.session.accountInfo}/user">
            <span class="glyphicon glyphicon-user"></span><br>UTILISATEURS
        </a>
    </li>
    {/if}
    {if (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) }
    <li>
        <a href="{$head->baseUrl}/{$smarty.session.accountInfo}/corpo">
            <span class="glyphicon glyphicon-globe"></span><br>CORPO
        </a>
    </li>
    {/if}
    {if (isset($view->is_group_admin) && $view->is_group_admin === TRUE) ||
        (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE)
    }
    <li>
        <a href="{$head->baseUrl}/{$smarty.session.accountInfo}/group/{$smarty.session.group}">
            <span class="glyphicon glyphicon-user"></span><br>GROUPE
        </a>
    </li>
    {/if}
    {if (isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) ||
        (isset($view->is_group_admin) && $view->is_group_admin === TRUE) ||
        (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE)
    }
    <li>
        <a href="{$head->baseUrl}/{$smarty.session.accountInfo}/agency/{$smarty.session.agency}">
            <span class="glyphicon glyphicon-edit"></span><br>AGENCE
        </a>
    </li>
    {/if}
    {if (isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) ||
        (isset($view->is_group_admin) && $view->is_group_admin === TRUE) ||
        (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) ||
        (isset($view->is_user) && $view->is_user === TRUE)
    }
    <li>
        <a href="{$head->baseUrl}/{$smarty.session.accountInfo}/quiz">
            <span class="glyphicon glyphicon-user"></span><br>QUIZ
        </a>
    </li>
    {/if}
    {if (isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) ||
        (isset($view->is_group_admin) && $view->is_group_admin === TRUE) ||
        (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE)
    }
    <li>
        <a href="{$head->baseUrl}/{$smarty.session.accountInfo}/report">
            <span class="glyphicon glyphicon-user"></span><br>REPORTS
        </a>
    </li>
    {/if}
</ul>
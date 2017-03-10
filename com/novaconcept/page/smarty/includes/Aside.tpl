<ul>
    {if (isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) ||
        (isset($view->is_group_admin) && $view->is_group_admin === TRUE) ||
        (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE)
    }
    <li>
        <a href="{$head->baseUrl}/{$smarty.session.accountInfo}/user" {if (isset($view->is_user_active) ) }class="active"{/if}>
            <span class="nv-glyphicon nv-glyphicon-user"></span><br>
            <span class="text">Utilisateur</span>
        </a>
    </li>
    {/if}
    {if (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) }
    <li>
        <a href="{$head->baseUrl}/{$smarty.session.accountInfo}/corpo" {if (isset($view->is_corpo_active) ) }class="active"{/if}>
            <span class="nv-glyphicon nv-glyphicon-corpo"></span><br>
            <span class="text">Corporate</span>
        </a>
    </li>
    {/if}
    {if (isset($view->is_group_admin) && $view->is_group_admin === TRUE) ||
        (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE)
    }
    <li>
        <a href="{$head->baseUrl}/{$smarty.session.accountInfo}/group/{$smarty.session.group}" {if (isset($view->is_group_active) ) }class="active"{/if}>
            <span class="nv-glyphicon nv-glyphicon-groupe"></span><br>
            <span class="text">Groupe</span>
        </a>
    </li>
    {/if}
    {if (isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) ||
        (isset($view->is_group_admin) && $view->is_group_admin === TRUE) ||
        (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE)
    }
    <li>
        <a href="{$head->baseUrl}/{$smarty.session.accountInfo}/agency/{$smarty.session.agency}" {if (isset($view->is_agency_active) ) }class="active"{/if}>
            <span class="nv-glyphicon nv-glyphicon-agency"></span><br>
            <span class="text">Agence</span>
        </a>
    </li>
    {/if}
    {if (isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) ||
        (isset($view->is_group_admin) && $view->is_group_admin === TRUE) ||
        (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE) ||
        (isset($view->is_user) && $view->is_user === TRUE)
    }
    <li>
        <a href="{$head->baseUrl}/{$smarty.session.accountInfo}/quiz" {if (isset($view->is_quiz_active) ) }class="active"{/if}>
            <span class="nv-glyphicon nv-glyphicon-edit"></span><br>
            <span class="text">Quiz</span>
        </a>
    </li>
    {/if}
    {if (isset($view->is_agency_admin) && $view->is_agency_admin === TRUE) ||
        (isset($view->is_group_admin) && $view->is_group_admin === TRUE) ||
        (isset($view->is_corpo_admin) && $view->is_corpo_admin === TRUE)
    }
    <li>
        <a href="{$head->baseUrl}/{$smarty.session.accountInfo}/report" {if (isset($view->is_report_active) ) }class="active"{/if}>
            <span class="nv-glyphicon nv-glyphicon-report"></span><br>
            <span class="text">Reports</span>
        </a>
    </li>
    {/if}
</ul>
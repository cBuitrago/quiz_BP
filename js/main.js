//Constants
var PDF_GEN_OPTION_ANSWERS_SHORT = 0;
var PDF_GEN_OPTION_SHOW_GRAPH = 1;
var PDF_GEN_OPTION_SHOW_ANSWERS = 2;
var PDF_GEN_OPTION_SEPERATE_PDF = 3;
var PDF_GEN_OPTION_USER_REPORT_COMPARE = 4;
var PDF_GEN_OPTION_SHOW_ANSWERS_SCORES = 5;
var PDF_GEN_OPTION_SHOW_BEST_ANSWERS = 6;

//Constants from DB "nova_api_get_report_data.php" call
var DB_QUIZ_RESULTS_ID = 0;
var DB_QUIZ_RESULTS_QUIZ_ID = 1;
var DB_QUIZ_RESULTS_USER_ID = 2;
var DB_QUIZ_RESULTS_START_DATE = 3;
var DB_QUIZ_RESULTS_END_DATE = 4;
var DB_QUIZ_RESULTS_PROGRESS_ID = 5;
var DB_QUIZ_RESULTS_ANSWERS = 6;
var DB_QUIZ_RESULTS_QUIZ_SCORE = 7;
var DB_QUIZ_RESULTS_PREVIOUS_ANSWERS = 8;
var DB_QUIZ_RESULTS_PREVIOUS_SCORES = 9
var DB_QUIZ_RESULTS_QUIZ_NAME = 10;
var DB_QUIZ_RESULTS_USER_NAME = 11;
var DB_QUIZ_RESULTS_CORPORATE_ID = 12;
var DB_QUIZ_RESULTS_CORPORATE_NAME = 13;
var DB_QUIZ_RESULTS_GROUP_ID = 14;
var DB_QUIZ_RESULTS_GROUP_NAME = 15;
var DB_QUIZ_RESULTS_AGENCY_ID = 16;
var DB_QUIZ_RESULTS_AGENCY_NAME = 17;
var DB_QUIZ_RESULTS_PROGRESS_NAME = 18;

var tableData;
var tableUsers;
var tableUserAgency;

window.addEventListener("load", function () {
    var userTable = document.getElementById("usersTable");
    if (userTable) {
        GetAllUsersFromServer();
    }
    var userTableAgency = document.getElementById("dataTableAgency");
    if (userTableAgency) {
        GetAllUsersAgencyFromServer();
    }
    /**
     *  LOGIN, LOGOUT
     */
    var login = document.getElementById("onLogin")
    if (login)
        login.addEventListener("click", onLogin);
    var logout = document.getElementById("onLogout")
    if (logout)
        logout.addEventListener("click", onLogout);
    /**
     * USER
     */
    var userEdit = document.getElementById("onUserEdit");
    if (userEdit)
        userEdit.addEventListener("click", onUserEdit);
    var userAdd = document.getElementById("onUserAdd");
    if (userAdd)
        userAdd.addEventListener("click", onUserAdd);
    var usersCreate = document.getElementById("onUsersCreate");
    if (usersCreate)
        usersCreate.addEventListener("click", onUsersCreate);
    var userAddAccount = document.getElementById("onUserAddAccount");
    if (userAddAccount)
        userAddAccount.addEventListener("click", onUserAddAccount);
    var userRemove = document.getElementById("onUserRemove");
    if (userRemove)
        userRemove.addEventListener("click", onUserRemove);
    var userEditPassword = document.getElementById("onUserEditPassword");
    if (userEditPassword)
        userEditPassword.addEventListener("click", onUserEditPassword);
    var userEditDepartment = document.getElementById("onUserEditDepartment");
    if (userEditDepartment)
        userEditDepartment.addEventListener("click", onUserEditDepartment);
    var userEditProfile = document.getElementById("onUserEditProfile");
    if (userEditProfile)
        userEditProfile.addEventListener("click", onUserEditProfile);
    var userChangePassword = document.getElementById("onUserChangePassword");
    if (userChangePassword)
        userChangePassword.addEventListener("click", onUserChangePassword);
    var userEditPermission = document.getElementById("onUserEditPermission");
    if (userEditPermission)
        userEditPermission.addEventListener("click", onUserEditPermission);
    var userEditAgency = document.getElementById("onUserEditAgency");
    if (userEditAgency)
        userEditAgency.addEventListener("click", onUserEditAgency);
    /**
     * DEPARTMENT
     */
    var addDepartment = document.getElementById("onDepartmentAdd");
    if (addDepartment)
        addDepartment.addEventListener("click", onDepartmentAdd);
    var editDepartment = document.getElementById("onDepartmentEdit");
    if (editDepartment)
        editDepartment.addEventListener("click", onDepartmentEdit);
    /**
     * QUIZ
     */
    var addQuiz = document.getElementById("onAddQuiz");
    if (addQuiz)
        addQuiz.addEventListener("click", onAddQuiz);
    var userResult = document.getElementById("onUserResult");
    if (userResult)
        userResult.addEventListener("click", onUserResult);

    /**/
    var cancelAll = document.getElementById("cancelAll")
    if (cancelAll)
        cancelAll.addEventListener("click", onCancelAll);
    /**
     * TEST
     */
    var test = document.getElementById("test");
    if (test)
        test.addEventListener("click", onTest);

    $("input.editInput").keyup(function () {
        $(this).addClass('changed');
    });
    $(".cancelAll").click(function () {
        location.reload();
    });
});
var error404 = "error 404";
var error409 = "error 409";
var unknownError = "Ouch";
var onTestComplete = function (data)
{
    console.log(data.responseText);
}

function onTest()
{
    var data = {};
    data.id = document.getElementById("idUser").value;
    data.QUIZ_ID = "QUIZ_02";
    data.START_DATE = "2017-01-01";
    data.END_DATE = "2017-01-02";
    data.PROGRESS_ID = "3";
    data.ANSWERS = "s0q0a1,s0q1a1,s0q2a2,s1q0a0,s1q1a2,s1q2a2,s2q0a1,s2q1a3,s2q2a1,s3q0a1,s3q1a0,s3q2a0,s4q0a1,s4q1a0,s4q2a3,s5q0a1,s5q1a0,s5q2a0,s6q0a0,s6q1a0,s6q2a2";
    data.QUIZ_SCORE = "s0r1m6,s1r1m6,s2r1m6,s3r6m6,s4r5m6,s5r1m6,s6r4m6";
    $.ajax({
        method: "POST",
        url: baseUrl + "/php/test.php",
        processData: false,
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(data),
        complete: onTestComplete
    });
}

function onCancelAll()
{
    location.reload();
}
/**
 *  LOGIN, LOGOUT
 */
var onLoginComplete = function (data)
{
    if (data.responseText === "true")
    {
        var url = window.location.pathname.split("/");
        if (url[url.length - 1] == 'login' || url[url.length - 1] == 'connexion' || url[url.length - 1] == 'logout')
        {
            var newUrl = baseUrl + '/profile';
            window.location.assign(newUrl);
        } else
        {
            location.reload();
        }
    } else if (data.responseText === "forceChange")
    {
        var url = window.location.pathname.split("/");
        if (url[url.length - 1] == 'login' || url[url.length - 1] == 'connexion' || url[url.length - 1] == 'logout')
        {
            var newUrl = baseUrl + '/change';
            window.location.assign(newUrl);
        } else
        {
            location.reload();
        }
    } else {
        $('.login_failed').removeClass('hidden_failed');
    }
}

function onLogin(e)
{
    $('.login_failed').addClass('hidden_failed');
    e.preventDefault();
    var user = document.getElementById("username").value.trim();
    var password = document.getElementById("psw").value.trim();
    var encoded = window.btoa(user + ":" + password);
    $.ajax({
        type: "GET",
        url: baseUrl + "/php/login_ajax.php",
        headers: {Authorization: encoded},
        complete: onLoginComplete
    });
}

var onLogoutComplete = function (data)
{
    if (data.responseText === "true")
    {
        var newUrl = baseUrl + '/login';
        window.location.assign(newUrl);
    }
}

function onLogout()
{
    $.ajax({
        type: "GET",
        url: baseUrl + "/php/logout_ajax.php",
        complete: onLogoutComplete
    });
}

/**
 *  USER
 */
function onUserFind()
{
    var userFind = document.getElementById('find_user_form');
    var url = baseUrl + '/' + account + '/user/find?search_term=' + userFind["email"].value + '&page=' + userFind["page"].value + "&per_page=" + userFind["page_per"].value;
    window.location.assign(url);
}

var onUserEditComplete = function (data)
{
    if (data.responseText === "true")
    {
        location.reload();
    } else
    {
        location.reload();
    }
}

function onUserEdit()
{
    var form = document.getElementById('edit_user_form');
    var data = {};
    data.id = form["id"].value;
    data.name = form["name"].value;
    data.firstName = form["firstName"].value;
    data.username = form["username"].value.trim();
    data.userAuthentication = {};
    data.userAuthentication.isActive = form["authentication_is_active"].checked;
    data.userAuthentication.attemptFail = form["authentication_attempt_fail"].value;
    data.userAuthentication.forceChange = form["authentication_force_change"].checked;
    $.ajax({
        method: "POST",
        url: baseUrl + "/php/user_edit_ajax.php",
        processData: false,
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(data),
        complete: onUserEditComplete
    });
}

function onUserEditPermission()
{
    var form = document.getElementById('edit_user_permission_form');
    var data = {};
    data.id = form["prevoius_permission"].value;
    data.userPermission;
    for (var i = 0; i < form["permission_list"].length; i++)
    {
        if (form["permission_list"][i].checked)
        {
            data.userPermission = form["permission_list"][i].value;
        }
    }

    $.ajax({
        method: "POST",
        url: baseUrl + "/php/user_edit_permission_ajax.php",
        processData: false,
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(data),
        complete: onUserEditComplete
    });
}

function onUserEditAgency()
{
    var form = document.getElementById('edit_user_agency_form');
    var data = {};
    data.id = form["id"].value;
    data.departmentId;
    for (var i = 0; i < form["user_agency"].length; i++)
    {
        if (form["user_agency"][i].checked)
        {
            data.departmentId = form["user_agency"][i].value;
        }
    }

    $.ajax({
        method: "POST",
        url: baseUrl + "/php/user_edit_agency_ajax.php",
        processData: false,
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(data),
        complete: onUserEditComplete
    });
}

var onUserAddComplete = function (data)
{
    if (data.responseText === "user_exists")
    {
        location.reload();
    } else if (data.responseText !== "false")
    {
        var url = baseUrl + '/' + account + '/user/' + data.responseText + '/edit';
        window.location.assign(url);
    } else
    {
        console.log("bad");
    }
}

function onUserAdd()
{
    var data = {};
    var form = document.getElementById('add_user_form');
    if (validateInput(form["firstName"])) {
        data['firstName'] = form["firstName"].value;
    } else {
        return false;
    }
    if (validateInput(form["name"])) {
        data['name'] = form["name"].value;
    } else {
        return false;
    }
    if (validateInput(form["email"]), 'name') {
        data['username'] = form["email"].value.trim();
    } else {
        return false;
    }
    if (validateInput(form["password"])) {
        data['password'] = form["password"].value.trim();
    } else {
        return false;
    }
    data.forceChange = form["force"].checked;
    $.ajax({
        method: "POST",
        url: baseUrl + "/php/user_add_ajax.php",
        processData: false,
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(data),
        complete: onUserAddComplete
    });
}

var onUserAddAccountComplete = function (data)
{
    if (data.responseText === "true")
    {
        var url = baseUrl + '/' + account + '/user/list';
        window.location.assign(url);
    } else
    {
        console.log("bad");
    }
}

function onUsersCreate()
{
    var data = {};
    $.ajax({
        method: "POST",
        url: baseUrl + "/php/create_users_ajax.php",
        processData: false,
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(data),
        complete: onUsersCreateAccountComplete
    });
}

var onUsersCreateAccountComplete = function (data)
{
    if (data.responseText === "true")
    {
        var url = baseUrl + '/' + account + '/user/list';
        window.location.assign(url);
    } else
    {
        console.log("bad");
    }
}

function onUserAddAccount()
{
    var form = document.getElementById('add_user_account_form');
    var email = form["email"].value;
    $.ajax({
        method: "POST",
        url: baseUrl + "/php/user_add_account_ajax.php",
        processData: false,
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(email),
        complete: onUserAddAccountComplete
    });
}

var onUserRemoveComplete = function (data)
{
    if (data.responseText === "true")
    {
        var url = baseUrl + '/' + account + '/user/list';
        window.location.assign(url);
    } else
    {
        if (data.responseText === "404")
        {
            document.getElementById("errorMsg").innerHTML = error404;
        }
        if (data.responseText === "409")
        {
            document.getElementById("errorMsg").innerHTML = error409;
        } else
        {
            document.getElementById("errorMsg").innerHTML = unknownError;
        }
        $('#msgModal').modal('show');
    }
}

function onUserRemove()
{
    var form = document.getElementById('edit_user_form');
    var data = {};
    data.id = form['id'].value;
    $.ajax({
        method: "POST",
        url: baseUrl + "/php/user_remove_ajax.php",
        processData: false,
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(data),
        complete: onUserRemoveComplete
    });
}

var onUserEditPasswordComplete = function (data)
{
    if (data.responseText === "true")
    {
        var newUrl = baseUrl + '/profile';
        window.location.assign(newUrl);
    } else
    {
        console.log("bad");
    }
}

function onUserEditPassword()
{
    var form = document.getElementById('edit_user_password_form');
    if ((form["psw"].value != form["psw1"].value) || (form["psw"].value == ''))
    {
        return;
    }
    var psw = form["psw"].value.trim();
    var encoded = window.btoa(psw);
    $.ajax({
        method: "POST",
        url: baseUrl + "/php/user_edit_password_ajax.php",
        headers: {Authorization: encoded},
        complete: onUserEditPasswordComplete
    });
}

function onUserChangePassword()
{
    var form = document.getElementById('change_user_password_form');
    if ((form["psw"].value != form["psw1"].value) || (form["psw"].value == ''))
    {
        return;
    }
    var psw = form["psw"].value.trim();
    var encoded = window.btoa(psw);
    var data = {};
    data.id = form["id"].value;
    $.ajax({
        method: "POST",
        url: baseUrl + "/php/user_change_password_ajax.php",
        headers: {Authorization: encoded},
        data: JSON.stringify(data),
        complete: onUserEditPasswordComplete
    });
}

var onUserEditDepartmentComplete = function (data)
{
    if (data.responseText === "true")
    {
        var newUrl = baseUrl + '/' + account + '/user';
        window.location.assign(newUrl);
    } else
    {
        console.log("bad");
    }
}

function onUserEditDepartment()
{
    var form = document.getElementById('edit_user_password_form');
    var divs = form.querySelectorAll('div.children');
    var data = {};
    data.info = [];
    for (var i = 0; i < divs.length; i++)
    {
        var selected = divs[i].querySelector('input[name="selected"]');
        var is_recursive = divs[i].querySelector('input[name="is_recursive"]');
        var authorization = divs[i].querySelector('input[name="authorization"]');
        if (selected.checked === true)
        {
            var info = {};
            info.userInfo = form['user_id'].value;
            info.departmentInfo = selected.value;
            info.authorization = authorization.value;
            info.isRecursive = is_recursive.checked;
            data.info.push(info);
        }
    }
    data.authorizations = authorizations;
    $.ajax({
        method: "POST",
        url: baseUrl + "/php/user_edit_department.php",
        processData: false,
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(data),
        complete: onUserEditDepartmentComplete
    });
}

function onUserEditProfile()
{
    var form = document.getElementById('edit_user_profile_form');
    var data = {};
    data.firstName = form["firstName"].value;
    data.name = form["name"].value;
    data.username = form["username"].value.trim();
    $.ajax({
        method: "POST",
        url: baseUrl + "/php/user_edit_profile_ajax.php",
        processData: false,
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(data),
        complete: onUserEditComplete
    });
}

/**
 *  DEPARTMENT
 */
var onDepartmentAddComplete = function (data)
{
    if (data.responseText === "true")
    {
        location.reload();
    } else
    {
        console.log("bad");
    }
}

function onDepartmentAdd()
{
    var data = {};
    var form = document.getElementById('add_department_form');
    if (validateInput(form["name"])) {
        data['name'] = form["name"].value;
    }
    data['description'] = form["description"].value;
    if (form["parent"].value != 0)
    {
        data['parent'] = parseInt(form["parent"].value);
    } else
    {
        data['parent'] = null;
    }

    $.ajax({
        method: "POST",
        url: baseUrl + "/php/department_add_ajax.php",
        processData: false,
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(data),
        complete: onDepartmentAddComplete
    });
}

var onDepartmentEditComplete = function (data)
{
    if (data.responseText === "true")
    {
        location.reload();
    } else
    {
        console.log("bad");
    }
}

function onDepartmentEdit()
{
    var data = {};
    var form = document.getElementById('edit_department_form');
    data.id = form["id"].value;
    if (validateInput(form["name"])) {
        data['name'] = form["name"].value;
    } else {
        return false;
    }
    data.description = form["description"].value;
    data.isActive = true;
    data.parent = parseInt(form["parent"].value);
    $.ajax({
        method: "POST",
        url: baseUrl + "/php/department_edit_ajax.php",
        processData: false,
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(data),
        complete: onDepartmentEditComplete
    });
}

/**
 *  QUIZ
 */
var onQuizAddComplete = function (data)
{
    console.log(data);
    if (data.responseText === "true")
    {
        location.reload();
    } else
    {
        console.log("bad");
    }
}

function onAddQuiz()
{
    var data = {};
    var form = document.getElementById('add_quiz_form');
    if (validateInput(form["QUIZ_ID"], 'name')) {
        data['quizId'] = form["QUIZ_ID"].value;
    } else {
        return false;
    }
    if (validateInput(form["TIME_TO_COMPLETE"], 'number')) {
        data['timeToComplete'] = form["TIME_TO_COMPLETE"].value;
    } else {
        return false;
    }
    if (validateInput(form["QUIZ_DATA"], 'text')) {
        data['quizData'] = form["QUIZ_DATA"].value;
    } else {
        return false;
    }
    if (validateInput(form["ANSWER_JSON"], 'text')) {
        data['answerJson'] = form["ANSWER_JSON"].value;
    } else {
        return false;
    }

    data['lockedOnCompletion'] = form["LOCKED_ON_COMPLETION"].checked;
    data['isUserCanDisplayChart'] = form["IS_USER_CAN_DISPLAY_CHART"].checked;
    data['isUserCanDisplayQa'] = form["IS_USER_CAN_DISPLAY_QA"].checked;
    data['isEnabled'] = form["IS_ENABLED"].checked;
    data['isUserSeeGoodAnswer'] = form["IS_USER_SEE_GOOD_ANSWER"].checked;
    data['agencies'] = [];
    for (var i = 0; i < form['agency_quiz'].length; i++)
    {
        if (form['agency_quiz'][i].checked == true) {
            data.agencies.push(form['agency_quiz'][i].value);
        }
    }

    if (data.agencies.length == 0){
        $("input:radio[name='agency_quiz']").focus();
        return false;
    }

    $.ajax({
        method: "POST",
        url: baseUrl + "/php/quiz_add_ajax.php",
        processData: false,
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(data),
        complete: onQuizAddComplete
    });
}
/***
 * RESULTS
 */
function onUserResult()
{
    var form = document.getElementById('quizResultsSelf');
    var idQuiz = form['idQuiz'].value;

    $.ajax({
        url: "../../php/nova_api_get_report_self_data.php",
        type: 'post',
        async: true,
        headers: {"cache-control": "no-cache"},
        cache: false,
        data: idQuiz,
        dataType: "text",
        success: function (return_data) {
            //If cannot access database, we are in OFFLINE mode
            if (return_data == "QUERY_ERROR" || return_data == "DB_OPEN_ERROR" || return_data == "DB_READ_ERROR")
            {
                alert("ERREUR: lecture de la base de donn\351es impossible...");
                return;
            }
            var return_data_array = JSON.parse(return_data);
            var data0 = return_data_array[0];
            var data1 = return_data_array[1];
            var data2 = return_data_array[2];
            CreateUserPDF(JSON.stringify(data0), JSON.stringify(data1), JSON.stringify(data2));
        },
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {
            alert("ERREUR: lecture de la base de donn\351es impossible...");
        }
    });
}
/**
 *  UTILITY
 */
function validateInput(inpt, a)
{
    if (inpt.type == 'checkbox' || inpt.type == 'hidden')
    {
        return true;
    }
    if (a === undefined)
    {
        var a = inpt.name.toLowerCase();
    }
    if (a.search('text') != -1)
    {
        if (inpt.value != '')
        {
            return true;
        } else
        {
            return false;
        }
    }
    if (a.search('phone') != -1)
    {
        var pattern = /^(\+1)? ?\(?[0-9]{3}\)? ?-?[0-9]{3} ?-?[0-9]{2} ?-?[0-9]{2}$/;
    }
    if (a.search('password') != -1)
    {
        var pattern = /^.{4,16}$/;
    }
    if (a.search('name') != -1 || a.search('city') != -1 || a.search('province') != -1 || a.search('country') != -1 || a.search('company') != -1 || a.search('description') != -1)
    {
        var pattern = /^[a-zA-Z0-9ÀÁÂÃÄÅàáâãäåÒÓÔÕÖØòóôõöøÈÉÊËèéêëÇçÌÍÎÏìíîïÙÚÛÜùúûüÿÑñ_-\s]{2,256}$/;
    }
    if (a.search('email') != -1)
    {
        var pattern = /^.{2,30}@.{2,30}\.[a-zA-Z]{2,6}$/;
    }
    if (a.search('code') != -1)
    {
        var pattern = /^[a-zA-Z0-9\s\- ]{2,64}$/;
    }
    if (a.search('expires') != -1 || a.search('date') != -1)
    {
        var pattern = /(^20(1[5-9]{1}|[2-9]{1}[0-9]{1})-(0[1-9]{1}|1[0-2]{1})-([0-2]{1}[0-9]{1}|3[0-1]{1})$|^[a-zA-Z]{3,10} ([0-2]{1}[0-9]{1}|3[0-1]{1}), 20(1[0-9]{1}|[2-9]{1}[0-9]{1}), [0-9]{1,2}:[0-9]{1,2} (pm|am)$)/;
    }
    if (a.search('address') != -1)
    {
        var pattern = /^.{0,256}$/;
    }
    if (a.search('file') != -1)
    {
        var pattern = /^[a-zA-Z0-9\\:\/]{0,256}.zip$/;
    }
    if (a.search('number') != -1)
    {
        var pattern = /^[0-9]{0,256}$/;
    }
    if (inpt.value.match(pattern)) {
        return true;
    }

    inpt.focus();
    return false;
}

function GetAllUsersFromServer()
{
    $.ajax({
        url: baseUrl + "/php/user_get_all_ajax.php",
        type: 'post',
        async: true,
        headers: {"cache-control": "no-cache"},
        cache: false,
        dataType: "text",
        success: function (return_data) {
            //If cannot access database
            if (return_data == "FALSE")
            {
                alert("ERREUR: base de donn\351es innaccessible...");
                return;
            } else {
                tableData = JSON.parse(return_data);
                LoadDataTable();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {
            alert("ERROR !");
        }
    });
}

function GetAllUsersAgencyFromServer()
{
    var id = document.getElementById('id');
    $.ajax({
        url: baseUrl + "/php/user_get_agency_ajax.php",
        type: 'post',
        async: true,
        headers: {"cache-control": "no-cache"},
        cache: false,
        data: id.value,
        dataType: "text",
        success: function (return_data) {
            //If cannot access database
            if (return_data == "FALSE")
            {
                alert("ERREUR: base de donn\351es innaccessible...");
                return;
            } else {
                var helper = JSON.parse(return_data);
                tableData = helper.users;
                LoadDataTableAgency();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {
            alert("ERROR !");
        }
    });
}


/**
 *  DATATABLE
 */
function LoadDataTable()
{
    tableUsers = $('#usersTable').DataTable(
            {
                aLengthMenu: [[10, 25, 50, -1], [10, 25, 50, "Tous"]],
                data: tableData,
                select:
                        {
                            style: 'single'
                        },
                dom: 'Bflrtip',
                buttons: [
                    {
                        text: 'S&eacute;lectionner tout',
                        className: 'black',
                        action: function () {
                            //table.rows().select();
                            //Reset selection first
                            table.rows().deselect();
                            table.rows({search: 'applied'}).select();
                        }
                    },
                    {
                        text: 'S&eacute;lectionner aucun',
                        className: 'black',
                        action: function () {
                            table.rows().deselect();
                        }
                    },
                ],
                //******* ATTENTION !!!: si on change les valeurs de "name", changer les noms utilis�s dans la fonction ApplyFilters()...
                columns: [
                    {name: "USER_ID", data: 0, title: "ID", visible: false},
                    {name: "USER_NOM", data: 1, title: "NOM DE FAMILLE", className: "dt-center"},
                    {name: "USER_PRENOM", data: 2, title: "PRENOM", className: "dt-center"},
                    {name: "USERNAME", data: 3, title: "NOM D'USAGER", visible: false},
                    {name: "AGENCY", data: 4, title: "AGENCE", className: "dt-center"},
                    {name: "GROUP", data: 5, title: "GROUPE", className: "dt-center"},
                    {name: "CORPO", data: 6, title: "CORPO", visible: false}
                ],
                language: {
                    sProcessing: "Traitement en cours...",
                    sSearch: "",
                    sLengthMenu: "Afficher _MENU_ &eacute;l&eacute;ments",
                    sInfo: "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
                    sInfoEmpty: "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ment",
                    sInfoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
                    sInfoPostFix: "",
                    sLoadingRecords: "Chargement en cours...",
                    sZeroRecords: "Aucun &eacute;l&eacute;ment &agrave; afficher",
                    sEmptyTable: "Aucune donn&eacute;e disponible dans le tableau",
                    oPaginate: {
                        sFirst: "Premier",
                        sPrevious: "< Pr&eacute;c&eacute;dent",
                        sNext: "Suivant >",
                        sLast: "Dernier"
                    },
                    oAria: {
                        sSortAscending: ": activer pour trier la colonne par ordre croissant",
                        sSortDescending: ": activer pour trier la colonne par ordre d&eacute;croissant"
                    },
                    select: {
                        rows: {
                            _: "%d lignes s&eacute;lectionn&eacute;es",
                            0: "Cliquez pour s&eacute;lectionner une ligne",
                            1: "1 ligne s&eacute;lectionn&eacute;e"
                        }
                    }
                },
            });
    $('input[type="search"]').attr('placeholder', 'Rechercher');
    tableUsers
            .on('select', function (e, dt, type, indexes) {
                var dataSelected = tableUsers.rows({selected: true}).data().toArray()
                var newUrl = baseUrl + '/' + account + '/user/' + dataSelected[0][0] + '/edit';
                window.location.assign(newUrl);
            });
}

function LoadDataTableAgency()
{
    tableUserAgency = $('#dataTableAgency').DataTable(
            {
                aLengthMenu: [[10, 25, 50, -1], [10, 25, 50, "Tous"]],
                data: tableData,
                select:
                        {
                            style: 'single'
                        },
                dom: 'Bflrtip',
                //******* ATTENTION !!!: si on change les valeurs de "name", changer les noms utilis�s dans la fonction ApplyFilters()...
                columns: [
                    {name: "USER_ID", data: 0, title: "ID", visible: false},
                    {name: "USER_NOM", data: 2, title: "NOM DE FAMILLE", className: "dt-center"},
                    {name: "USER_PRENOM", data: 3, title: "PRENOM", className: "dt-center"},
                    {name: "USERNAME", data: 1, title: "NOM D'USAGER", className: "dt-center"},
                    {name: "CREATED", data: 4, title: "CREE", visible: false},
                    {name: "MODIFIED", data: 5, title: "MODIFIE", visible: false}
                ],
                language: {
                    sProcessing: "Traitement en cours...",
                    sSearch: "",
                    sLengthMenu: "Afficher _MENU_ &eacute;l&eacute;ments",
                    sInfo: "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
                    sInfoEmpty: "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ment",
                    sInfoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
                    sInfoPostFix: "",
                    sLoadingRecords: "Chargement en cours...",
                    sZeroRecords: "Aucun &eacute;l&eacute;ment &agrave; afficher",
                    sEmptyTable: "Aucune donn&eacute;e disponible dans le tableau",
                    oPaginate: {
                        sFirst: "Premier",
                        sPrevious: "< Pr&eacute;c&eacute;dent",
                        sNext: "Suivant >",
                        sLast: "Dernier"
                    },
                    oAria: {
                        sSortAscending: ": activer pour trier la colonne par ordre croissant",
                        sSortDescending: ": activer pour trier la colonne par ordre d&eacute;croissant"
                    },
                    select: {
                        rows: {
                            _: "&nbsp; %d lignes s&eacute;lectionn&eacute;es",
                            0: "&nbsp; Cliquez pour s&eacute;lectionner une ligne",
                            1: "&nbsp; 1 ligne s&eacute;lectionn&eacute;e"
                        }
                    }
                },
            });

    tableUserAgency
            .on('select', function (e, dt, type, indexes) {
                var dataSelected = tableUserAgency.rows({selected: true}).data().toArray()
                var newUrl = baseUrl + '/' + account + '/user/' + dataSelected[0][0] + '/edit';
                window.location.assign(newUrl);
            });
}
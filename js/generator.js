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



var table;
var update_data;
var quiz_table;
var progress_table;
var CreatePDF_Param_json_data;
var CreatePDF_Param_options_data;
var CreatePDF_Param_quiz_data;

var chartjs_config;

var offscreenCanvas;
var currentChart;

$body = $("body");

$(document).on({
    ajaxStart: function () {
        $body.addClass("loading");
    },
    ajaxStop: function () {
        $body.removeClass("loading");
    }
});

function GenerateParticipationReport()
{
    var count = table.rows({selected: true}).count();
    if (count == 0)
    {
        alert("Vous devez s\351lectionner au minimum une donn\351e dans le tableau...");
        return;
    }

    var selected_data = table.rows('.selected').data();

    CreateReportPDF(selected_data);
}

function GenerateUsersReports()
{
    var count = table.rows({selected: true}).count();
    if (count == 0)
    {
        alert("Vous devez s\351lectionner au minimum une donn\351e dans le tableau...");
        return;
    }

    var selected_data = table.rows('.selected').data();

    //Check if one selected data is not completed
    var incomplete_count = 0;
    for (var i = 0; i < count; i++)
    {
        if (table.rows('.selected').data()[i][DB_QUIZ_RESULTS_PROGRESS_ID] != 3)
            incomplete_count++;
    }
    //Warn user that some records will be ignored since they are not completed
    if (incomplete_count > 0)
    {
        var message;
        if (incomplete_count == 1)
            message = "1 quiz n'a pas \351t\351 compl\351t\351, celui-ci sera ignor\351... Voulez-vous poursuivre ?";
        else
            message = incomplete_count + " quiz n'ont pas \351t\351s compl\351t\351s, ceux-ci seront ignor\351s... Voulez-vous poursuivre ?";
        if (!confirm(message)) {
            return;
        }
    }
    var selected_array = new Array();
    for (i = 0; i < count; i++)
    {
        //Only add COMPLETED quiz data
        if (table.rows('.selected').data()[i][DB_QUIZ_RESULTS_PROGRESS_ID] == 3)
        {
            selected_array.push(selected_data[i]);
        }
    }
    //Prepare options array
    var options_array = new Array();
    //options_array[PDF_GEN_OPTION_ANSWERS_SHORT] = document.getElementById('answers_short').checked ? 1 :0;
    options_array[PDF_GEN_OPTION_SHOW_GRAPH] = document.getElementById('show_graph').checked ? 1 : 0;
    options_array[PDF_GEN_OPTION_SHOW_ANSWERS] = document.getElementById('show_answers').checked ? 1 : 0;
    //options_array[PDF_GEN_OPTION_SEPERATE_PDF] = document.getElementById('seperate_pdf').checked? 1 :0;
    var report_compare_Select = document.getElementById("user_report_compare");
    options_array[PDF_GEN_OPTION_USER_REPORT_COMPARE] = report_compare_Select.options[report_compare_Select.selectedIndex].value;
    options_array[PDF_GEN_OPTION_SHOW_ANSWERS_SCORES] = document.getElementById('show_answers_score').checked ? 1 : 0;
    options_array[PDF_GEN_OPTION_SHOW_BEST_ANSWERS] = document.getElementById('show_best_answers').checked ? 1 : 0;

    //Check if options are valid
    if ((options_array[PDF_GEN_OPTION_SHOW_GRAPH] == 0) && (options_array[PDF_GEN_OPTION_SHOW_ANSWERS] == 0))
    {
        alert("Les options de ne pas afficher le graphique de r\351sultats et de ne pas afficher les questions/r\351ponses ne peuvent pas \352tre s\351lestionn\351es en m\352me temps...");
        return;
    }

    //Prepare variables to be pass to PDF Generator once polar chart is completed (called on the 'Animation - onComplete' on graph config)
    CreatePDF_Param_json_data = JSON.stringify(selected_array);
    CreatePDF_Param_options_data = JSON.stringify(options_array)
    CreatePDF_Param_quiz_data = JSON.stringify(quiz_table);

    // window.open('#popup1',"_self");

    CreatePDF(CreatePDF_Param_json_data, CreatePDF_Param_options_data, CreatePDF_Param_quiz_data);

    /*************
     offscreenCanvas = document.createElement('canvas');
     offscreenCanvas.width = 600;
     offscreenCanvas.height = 600;
     var context2 = offscreenCanvas.getContext('2d');
     //Make background WHITE
     Chart.plugins.register({
     beforeDraw: function(chartInstance) {
     var ctx = chartInstance.chart.ctx;
     ctx.fillStyle = "white";
     ctx.fillRect(0, 0, chartInstance.chart.width, chartInstance.chart.height);
     }
     });
     
     currentChart = new Chart.Radar(context2, chartjs_config);
     ************/

    //	CreatePDF(JSON.stringify(selected_array), JSON.stringify(options_array), JSON.stringify(quiz_table));
}

function ApplyFilters()
{
    var quiz_select = document.getElementById("filter_quiz_id");
    var corporate_select = document.getElementById("filter_corporate_id");
    var group_select = document.getElementById("filter_group_id");
    var agency_select = document.getElementById("filter_agency_id");
    var completed_select = document.getElementById("filter_quiz_progress");

    if (quiz_select.options[quiz_select.selectedIndex].value == "all")
    {
        table.column(table.column('QUIZ_ID:name').index()).search("").draw();
    } else
    {
        table.column(table.column('QUIZ_ID:name').index()).search('^\\b' + quiz_select.options[quiz_select.selectedIndex].value + '\\b$', true, false).draw();
    }

    if (corporate_select.options[corporate_select.selectedIndex].value == "all")
    {
        table.column(table.column('CORPORATE_ID:name').index()).search("").draw();
    } else
    {
        table.column(table.column('CORPORATE_ID:name').index()).search('^\\b' + corporate_select.options[corporate_select.selectedIndex].value + '\\b$', true, false).draw();
    }

    if (group_select.options[group_select.selectedIndex].value == "all")
    {
        table.column(table.column('GROUP_ID:name').index()).search("").draw();
    } else
    {
        table.column(table.column('GROUP_ID:name').index()).search('^\\b' + group_select.options[group_select.selectedIndex].value + '\\b$', true, false).draw();
    }

    if (agency_select.options[agency_select.selectedIndex].value == "all")
    {
        table.column(table.column('AGENCY_ID:name').index()).search("").draw();
    } else
    {
        table.column(table.column('AGENCY_ID:name').index()).search('^\\b' + agency_select.options[agency_select.selectedIndex].value + '\\b$', true, false).draw();
    }

    if (completed_select.options[completed_select.selectedIndex].value == "all")
    {
        table.column(table.column('PROGRESS_ID:name').index()).search("").draw();
    } else
    {
        table.column(table.column('PROGRESS_ID:name').index()).search('^\\b' + completed_select.options[completed_select.selectedIndex].value + '\\b$', true, false).draw();
    }
}

$('#submitBtn').click(function () {
    alert($('#form').serialize());
    $.ajax({
        url: "nova_api_add.php",
        type: 'post',
        async: true,
        headers: {"cache-control": "no-cache"},
        cache: false,
        data: {data: JSON.stringify($('#form').serializeArray())},
        dataType: "text",
        success: function (return_data) {
            //If cannot access database
            if (return_data == "QUERY_ERROR" || return_data == "DB_OPEN_ERROR")
            {
                alert("ERREUR: base de donn\351es innaccessible...");
                return;
            } else if (return_data == "ID_ALREADY_EXISTS")
            {
                alert("Le ID D\351mo existe d\351j\340 dans la base de donn\351es, merci de choisir un nouveau nom...");
                document.getElementsByName('id_demo').focus();
                return;
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {
            alert("ERROR !");
        }
    });
});

function GetAllQuizInfoFromServer()
{
    $.ajax({
        url: "../php/nova_api_get_report_data.php",
        type: 'post',
        async: true,
        headers: {"cache-control": "no-cache"},
        cache: false,
        dataType: "text",
        success: function (return_data) {
            //If cannot access database, we are in OFFLINE mode
            if (return_data == "QUERY_ERROR" || return_data == "DB_OPEN_ERROR" || return_data == "DB_READ_ERROR")
            {
                Alert("ERREUR: lecture de la base de donn\351es impossible...");
                return;
            }
            return_data_array = JSON.parse(return_data);
            update_data = return_data_array[0];
            quiz_table = return_data_array[1];
            progress_table = return_data_array[2];
            LoadDataTable();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {
            alert("ERREUR: lecture de la base de donn\351es impossible...");
        }
    });
}

function GetQuizStructureFromServer()
{
    $.ajax({
        url: "nova_api_manager_get.php",
        type: 'post',
        async: true,
        headers: {"cache-control": "no-cache"},
        cache: false,
        data: {data: 'quiz'},
        dataType: "text",
        success: function (return_data) {
            //If cannot access database, we are in OFFLINE mode
            if (return_data == "QUERY_ERROR" || return_data == "DB_OPEN_ERROR")
            {
                Alert("ERREUR: lecture de la base de donn\351es impossible...");
                return;
            }
            quiz_table = JSON.parse(return_data);
            LoadDataTable();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {
            alert("ERREUR: lecture de la base de donn\351es impossible...");
        }
    });
}

function GetQuizResultsFromServer()
{
    $.ajax({
        url: "nova_api_manager_get.php",
        type: 'post',
        async: true,
        headers: {"cache-control": "no-cache"},
        cache: false,
        data: {data: 'results'},
        dataType: "text",
        success: function (return_data) {
            //If cannot access database, we are in OFFLINE mode
            if (return_data == "QUERY_ERROR" || return_data == "DB_OPEN_ERROR")
            {
                Alert("ERREUR: lecture de la base de donn\351es impossible...");
                return;
            }
            update_data = JSON.parse(return_data);
            GetQuizStructureFromServer();
            //LoadDataTable();
        },
        error: function (XMLHttpRequest, textStatus, errorThrown)
        {
            alert("ERREUR: lecture de la base de donn\351es impossible...");
        }
    });

}

function compareSecondColumn(a, b)
{
    if (a[1] === b[1]) {
        return 0;
    } else {
        return (a[1] < b[1]) ? -1 : 1;
    }
}

Array.prototype.contains = function (v) {
    for (var i = 0; i < this.length; i++) {
        if (this[i][1] === v)
            return true;
    }
    return false;
};

Array.prototype.unique_quiz_id = function () {
    var arr = [];
    for (var i = 0; i < this.length; i++) {
        if (!arr.contains(this[i][DB_QUIZ_RESULTS_QUIZ_NAME])) {
            var new_input = new Array();
            new_input[0] = this[i][DB_QUIZ_RESULTS_QUIZ_ID];
            new_input[1] = this[i][DB_QUIZ_RESULTS_QUIZ_NAME];
            //	arr.push(this[i][DB_QUIZ_RESULTS_QUIZ_NAME]);
            arr.push(new_input);
        }
    }
    return arr.sort(compareSecondColumn);
}

Array.prototype.unique_group_id = function () {
    var arr = [];
    for (var i = 0; i < this.length; i++) {
        if (!arr.contains(this[i][DB_QUIZ_RESULTS_GROUP_NAME])) {
            var new_input = new Array();
            new_input[0] = this[i][DB_QUIZ_RESULTS_GROUP_ID];
            new_input[1] = this[i][DB_QUIZ_RESULTS_GROUP_NAME];
            //arr.push(this[i][DB_QUIZ_RESULTS_GROUP_NAME]);
            arr.push(new_input);
        }
    }
    return arr.sort(compareSecondColumn);
}

Array.prototype.unique_corporate_id = function () {
    var arr = [];
    for (var i = 0; i < this.length; i++) {
        if (!arr.contains(this[i][DB_QUIZ_RESULTS_CORPORATE_NAME])) {
            var new_input = new Array();
            new_input[0] = this[i][DB_QUIZ_RESULTS_CORPORATE_ID];
            new_input[1] = this[i][DB_QUIZ_RESULTS_CORPORATE_NAME];
            //arr.push(this[i][DB_QUIZ_RESULTS_CORPORATE_NAME]);
            arr.push(new_input);
        }
    }
    return arr.sort(compareSecondColumn);
}

Array.prototype.unique_agency_id = function () {
    var arr = [];
    for (var i = 0; i < this.length; i++) {
        if (!arr.contains(this[i][DB_QUIZ_RESULTS_AGENCY_NAME])) {
            var new_input = new Array();
            new_input[0] = this[i][DB_QUIZ_RESULTS_AGENCY_ID];
            new_input[1] = this[i][DB_QUIZ_RESULTS_AGENCY_NAME];
            // arr.push(this[i][DB_QUIZ_RESULTS_AGENCY_NAME]);
            arr.push(new_input);
        }
    }
    return arr.sort(compareSecondColumn);
}


function LoadDataTable()
{
    table = $('#example').DataTable(
            {
                aLengthMenu: [[10, 25, 50, -1], [10, 25, 50, "Tous"]],
                data: update_data,
                select:
                        {
                            style: 'multi'
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
                    {name: "ID", data: DB_QUIZ_RESULTS_ID, title: "ID unique", visible: false},
                    {name: "USER_ID", data: DB_QUIZ_RESULTS_USER_ID, title: "ID Usager", visible: false},
                    {name: "USER_NAME", data: DB_QUIZ_RESULTS_USER_NAME, title: "Usager", className: "dt-center"},
                    {name: "CORPORATE_ID", data: DB_QUIZ_RESULTS_CORPORATE_ID, title: "ID Compagnie", visible: false},
                    {name: "CORPORATE_NAME", data: DB_QUIZ_RESULTS_CORPORATE_NAME, title: "Compagnie", className: "dt-center"},
                    {name: "GROUP_ID", data: DB_QUIZ_RESULTS_GROUP_ID, title: "ID Groupe", visible: false},
                    {name: "GROUP_NAME", data: DB_QUIZ_RESULTS_GROUP_NAME, title: "Groupe", className: "dt-center"},
                    {name: "AGENCY_ID", data: DB_QUIZ_RESULTS_AGENCY_ID, title: "ID Agence", visible: false},
                    {name: "AGENCY_NAME", data: DB_QUIZ_RESULTS_AGENCY_NAME, title: "Agence", className: "dt-center"},
                    {name: "QUIZ_ID", data: DB_QUIZ_RESULTS_QUIZ_ID, title: "ID Quiz", visible: false},
                    {name: "QUIZ_NAME", data: DB_QUIZ_RESULTS_QUIZ_NAME, title: "Quiz", className: "dt-center"},
                    {name: "START_DATE", data: DB_QUIZ_RESULTS_START_DATE, title: "Date d&eacute;but", className: "dt-center"},
                    {name: "END_DATE", data: DB_QUIZ_RESULTS_END_DATE, title: "Date fin", className: "dt-center"},
                    {name: "PROGRESS_ID", data: DB_QUIZ_RESULTS_PROGRESS_ID, title: "ID Progr&egrave;s", visible: false},
                    {name: "PROGRESS_NAME", data: DB_QUIZ_RESULTS_PROGRESS_NAME, title: "Progr&egrave;s", className: "dt-center"},
                    {name: "ANSWERS", data: DB_QUIZ_RESULTS_ANSWERS, title: "R&eacute;ponses", visible: false},
                    {name: "QUIZ_SCORE", data: DB_QUIZ_RESULTS_QUIZ_SCORE, title: "Pointage Quiz", visible: false},
                    {name: "PREVIOUS_ANSWERS", data: DB_QUIZ_RESULTS_PREVIOUS_ANSWERS, title: "Anciennes R&eacute;ponses", visible: false},
                    {name: "PREVIOUS_SCORES", data: DB_QUIZ_RESULTS_PREVIOUS_SCORES, title: "Pointage Quiz", visible: false}
                ],
                language: {
                    sProcessing: "Traitement en cours...",
                    sSearch: "Rechercher&nbsp;:",
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
                        sPrevious: "Pr&eacute;c&eacute;dent",
                        sNext: "Suivant",
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

    /*************  
     table.on( 'dblclick', 'td', function () {
     table.rows(this).deselect();
     var answer = prompt("Modifier valeur", table.cell( this ).data());
     var old_cell_value = table.cell( this ).data();
     //check if input is different from original value, not cancelled or null
     if(table.cell( this ).data() != answer && answer != null)
     {
     //If ID_DEMO column, verify name not alreayd exists
     if(table.cell( this ).index().column == 1)
     {
     SubmitDemoName(answer, this, old_cell_value);
     return;
     }
     else
     {
     table.cell(this).data(answer);
     Update_database(this, old_cell_value, answer);
     }
     }
     } );
     ******************/
    //Load filters content
    var quiz_id_unique = update_data.unique_quiz_id();
    var corporate_id_unique = update_data.unique_corporate_id();
    var group_id_unique = update_data.unique_group_id();
    var agency_id_unique = update_data.unique_agency_id();

    //Quiz_ID
    for (var i = 0; i < quiz_id_unique.length; i++)
    {
        var quiz_id_select = document.getElementById("filter_quiz_id");
        var option = document.createElement("option");
        option.text = quiz_id_unique[i][1];
        option.value = quiz_id_unique[i][0];
        quiz_id_select.add(option);
    }
    //Corporate_ID
    for (var j = 0; j < corporate_id_unique.length; j++)
    {
        var corporate_id_select = document.getElementById("filter_corporate_id");
        var option = document.createElement("option");
        option.text = corporate_id_unique[j][1];
        option.value = corporate_id_unique[j][0];
        corporate_id_select.add(option);
    }
    //Group_ID
    for (var k = 0; k < group_id_unique.length; k++)
    {
        var group_id_select = document.getElementById("filter_group_id");
        var option = document.createElement("option");
        option.text = group_id_unique[k][1];
        option.value = group_id_unique[k][0];
        group_id_select.add(option);
    }
    //Agency_ID
    for (var m = 0; m < agency_id_unique.length; m++)
    {
        var agency_id_select = document.getElementById("filter_agency_id");
        var option = document.createElement("option");
        option.text = agency_id_unique[m][1];
        option.value = agency_id_unique[m][0];
        agency_id_select.add(option);
    }
    //Progress_ID
    for (var n = 0; n < progress_table.length; n++)
    {
        var progress_id_select = document.getElementById("filter_quiz_progress");
        var option = document.createElement("option");
        option.text = progress_table[n][1];
        option.value = progress_table[n][0];
        progress_id_select.add(option);
    }


    //Reset selected values
    $("#filter_quiz_id").val("all");
    $("#filter_corporate_id").val("all");
    $("#filter_group_id").val("all");
    $("#filter_agency_id").val("all");
    $("#filter_quiz_progress").val("all");

}


$(document).ready(function () {
    //GetQuizResultsFromServer();
    GetAllQuizInfoFromServer();
});
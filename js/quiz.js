var counter = 0;
var totalSections;

$(document).ready(function () {
    $('#quiz-carousel').carousel({
        interval: false
    });
    hiddenIndicators();
    $("#quiz-carousel").on("slid.bs.carousel", hiddenIndicators);
    $("#previousSection").click(function () {
        previousForm();
    });
    $("#nextSection").click(function () {
        nextForm(false);
    });
    totalSections = document.getElementById('quiz-carousel').querySelectorAll('.item').length;
    if (timer_start){ f(); }
});

function hiddenIndicators() {
    $("#previousSection").removeClass('hidden');
    $("#nextSection").removeClass('hidden');

    if (document.getElementById('quiz-carousel').querySelector('.item.active').attributes["data-slide-value"].value == '0')
        $("#previousSection").addClass('hidden');

    if (document.getElementById('quiz-carousel').querySelector('.item.active').attributes["data-slide-value"].value == totalSections)
        $("#nextSection").addClass('hidden');
}

function previousForm() {
    $("a.left").click();
}

function nextForm(failed) {
    var failed = (typeof failed === 'undefined') ? false : failed;
    counter = $("#quiz-carousel .item.active").attr('data-slide-value');
    var tester = true;
    $("#quiz-carousel .item.active form fieldset").each(function () {
        var idCurrField = $(this).attr('id');
        if ($(this).find('input:radio[name=' + idCurrField + ']:checked').val() == undefined) {
            $(this).find('input')[0].focus();
            tester = false;
            if (failed === true) {
                sendData();
                return false;
            } else {
                return false;
            }
        }
        ;
    });
    if (tester === true && counter != (totalSections - 1)) {
        $("a.right").click();
    }

    if (tester === true && counter == (totalSections - 1)) {
        sendData();
    }
}

var onQuizResultsAddComplete = function (data) {
    if (data.responseText === "false") {
        var newUrl = baseUrl + '/' + account + '/' + quiz;
        window.location.assign(newUrl);
    } else {
        var newUrl = baseUrl + '/' + account + '/results/' + data.responseText;
        window.location.assign(newUrl);
    }
}

function sendData() {
    var data = {};
    var answerArray = [];
    var tester = true;
    $("#quiz-carousel fieldset").each(function () {
        var idCurrField = $(this).attr('id');
        if ($(this).find('input:radio[name=' + idCurrField + ']:checked').val() == undefined) {
            tester = false;
        } else {
            answerArray.push($(this).find('input:radio[name=' + idCurrField + ']:checked').val());
        }
    });
    data.QUIZ_ID = document.getElementById('quiz_name').value;
    if (tester === true) {
        data.ANSWERS = answerArray.join();
    } else {
        data.ANSWERS = "";
    }
    $.ajax({
        method: "POST",
        url: baseUrl + "/php/quiz_results_add_ajax.php",
        processData: false,
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(data),
        complete: onQuizResultsAddComplete
    });
}

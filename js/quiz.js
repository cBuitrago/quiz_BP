var output = "";
var value;//= 0; 	
var config;
var previousData; //= sortSelectedAnswers("<?php echo $_SESSION['previousData'][0][7]; ?>");
var counter = 0;
var totalSections;
/*$(function () {
 $('.timer').startTimer({classNames: {
 hours: 'hoursClass',
 minutes: 'minutesClass',
 seconds: 'secondsClass'}, onComplete: function () {
 manualPost("CalculateScore.php", {result: "fail"});
 }
 });
 
 });*/
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
        nextForm();
    });
    totalSections = document.getElementById('quiz-carousel').querySelectorAll('.item').length;
});

function hiddenIndicators()
{
    $("#previousSection").removeClass('hidden');
    $("#nextSection").removeClass('hidden');
    
    if (document.getElementById('quiz-carousel').querySelector('.item.active').attributes["data-slide-value"].value == '0')
        $("#previousSection").addClass('hidden');

    if (document.getElementById('quiz-carousel').querySelector('.item.active').attributes["data-slide-value"].value == totalSections)
        $("#nextSection").addClass('hidden');
}

function previousForm()
{
    $("a.left").click();
}

function nextForm()
{
    counter = $("#quiz-carousel .item.active").attr('data-slide-value');
    var tester = true;
    $("#quiz-carousel .item.active form fieldset").each(function () {
        var idCurrField = $(this).attr('id');
        if ($(this).find('input:radio[name='+ idCurrField +']:checked').val() == undefined ){
            $(this).find('input')[0].focus();
            tester = false;
            return false;
        };
    });
    if (tester == true && counter != (totalSections - 1)){
        $("a.right").click();
    }
    
    if (tester == true && counter == (totalSections - 1)){
        sendData();
    }
}

var onQuizResultsAddComplete = function (data)
{
    if (data.responseText === "false")
    {
        var newUrl = baseUrl + '/' + account + '/' + quiz;
        window.location.assign(newUrl);
    } 
    else
    {
        var newUrl = baseUrl + '/' + account + '/results/' + data.responseText;
        window.location.assign(newUrl);
    }
}

function sendData(){
    var data = {};
    var answerArray = [];
    $("#quiz-carousel fieldset").each(function () {
        var idCurrField = $(this).attr('id');
        answerArray.push($(this).find('input:radio[name='+ idCurrField +']:checked').val());
    });
    data.QUIZ_ID = document.getElementById('quiz_name').value;
    data.ANSWERS = answerArray.join();
    
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
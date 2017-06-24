$("#regbutton").click(function() {
    $("#regform").toggle();
    $("#intro").toggle();
});
$('#Cancel').click(function() {
    $("#regform").toggle();
    $("#intro").toggle();
});
$("#profile-image").show(function() {
    $("#loginbutton").hide();
    $("#alert").show();
})
var count = $("#alert li").children().length;
$("#alerttotal").text(count);
$(document).on("click", "#removefri", function() {
    var mid = $(this).parent().children("#mid").attr("class");
    var friid = $(this).parent().children("#almid").attr("class");

    $.get("fristatus", { "id": mid, "fri": friid, "type": "removeinvalid" }, function() {
            alert("fri: " + mid + "mid :" + friid);
        })
        .done(function(data) {
            if (data) {
                alert("移除成功");
                location.reload();
            }
        })
        .fail(function() {
            alert("移除失敗 ，請洽管理員");
        });
});
$(document).on("click", "#joinfri", function() {

    var mid = $(this).parent().children("#mid").attr("class");
    var friid = $(this).parent().children("#almid").attr("class");

    $.get("fristatus", { "id": friid, "fri": mid, "type": "join" }, function() {})
        .done(function(data) {
            if (data) {
                alert("成功加入");
                location.reload();
            }
        })
        .fail(function() {
            alert("加入失敗 ，請洽管理員");
        });
});

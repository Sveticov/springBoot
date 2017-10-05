$(document).ready(function () {
    var activ_button_forum = false;
    var id = -1;
    var user_id = -1;
    var user_name = "";




    $.ajax({
        type: "GET",
        url: "/get/user/actual",
        success: function (result) {



            $("#UserActualName").html(result.data.name);
            $("#UserActualId").html(result.data.user_id);


            if (result.data.name != null) {
                activ_button_forum = true;
                user_id = result.data.user_id;
                user_name = result.data.name;
            }

        },
        error: function (e) {
            alert("error view user" + e)
        }

    });


    $("#listTopic1").empty();
    $("#listTopic2").empty();
    $("#listTopic3").empty();


    $.ajax({
        type: "GET",
        url: "/listTopic",

        success: function (result) {

            $.each(result.data, function (i, topic) {

                if (activ_button_forum) {
                    var topicForum = "/forum/" + topic.topic_id + "/" + user_id + "/" + user_name;
                    var button_forum = ('<a href="' + topicForum + '"  ><button id="btn-test" class="btn btn-outline-primary">Forum</button></a>');

                    $("#btn-test").click(function (e) {

                    });
                }

                var listTopic = "<div class='card'>" +
                    "<h4 class='card-header  bg-primary text-white'>" + topic.topic_name + "</h4>" +
                    "<div class='card-body'><div class='container'> " +

                    "<p class='card-text'>" + topic.description + "</p>" + button_forum +
                    "</div></div></div><br\>";

                if (i % 3 == 0) {
                    $('#listTopic3').append(listTopic);
                } else {
                    if (i % 2 == 0) {
                        $('#listTopic2').append(listTopic);
                    } else {
                        if (i % 1 == 0) {
                            $('#listTopic1').append(listTopic);
                        }
                    }
                }

            });


        },
        error: function (e) {
            alert("error view topic" + e)
        }
    });


})
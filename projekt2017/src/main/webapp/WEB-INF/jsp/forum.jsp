<%--
  Created by IntelliJ IDEA.
  User: SVETICOV
  Date: 04.09.2017
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
          integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
            integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
            integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
            integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <script src="/js/topic_forum.js"></script>
    <script src="/js/app.js"></script>
    <title>Forum</title>
</head>
<body>
<nav class="navbar navbar-toggleable-md fixed-top navbar-inverse bg-inverse">
    <div class="container">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item ">
                <h1 class="navbar-brand">Forum</h1>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/welcome">Home</a>
            </li>


        </ul>
    </div>
</nav>
<!--####################################################################################################-->
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">${forum}</h1>
        <h5>${forum_description}</h5>
        <p hidden>${topic_id}</p>
        <h5>User:${user_name}</h5>
        <p hidden> user id:${user_id}</p>
        <p hidden><a class="btn btn-primary btn-lg" href="/welcome" role="button">Learn more &raquo;</a></p>
    </div>
</div>


<div class="container">

    <form>
        <div class="row">
            <div class="col-2">
                <label for="mess-text">Comment:</label>
            </div>
            <div class="col-8">
                <input type="text" class="form-control mb-4 mr-sm-4 mb-sm-0" id="mess-text">
            </div>
            <div class="col-2">
                <button type="submit" class="btn btn-primary" id="mess-send-btn" hidden>Send</button>
                <button type="submit" class="btn btn-default" id="btn-send">Send</button>
            </div>
        </div>

    </form>

</div>

<div class="container">

    <div id="listMessages">
        <ul class="list-group">
            <%--<div id="listMessages">--%>

            <%--</div>--%>
        </ul>
    </div>

</div>

<p id="topic-id-var" hidden></p>
<p id="user-id-var" hidden></p>
</body>





<script>
    $(document).ready(function ($) {




        $("#topic-id-var").val(${topic_id});
        $("#user-id-var").val(${user_id});




        <%--$("#mess-send-btn").click(function (event) {--%>
            <%--sendMessages();--%>
        <%--});--%>

        <%--function sendMessages() {--%>
            <%--var date_now = new Date();--%>
            <%--var dateMessage = date_now.getHours() + ":" + date_now.getMinutes() + ":" + date_now.getSeconds() + " " + date_now.toDateString();--%>
            <%--var data = {}--%>
            <%--data["mesage_text"] = $("#mess-text").val() + "</br><small> " + dateMessage + "</small>"--%>

            <%--$.ajax({--%>
                <%--type: "POST",--%>
                <%--contentType: "application/json",--%>
                <%--url: "/${topic_id}/${user_id}/message_send",--%>
                <%--data: JSON.stringify(data),--%>
                <%--dataType: 'json',--%>
                <%--success: function (data) {--%>
<%--//                     alert(data)--%>

                <%--}--%>
            <%--});--%>
        <%--}--%>


        listMessages();



        function listMessages() {
            $.ajax({
                type: "GET",
                url: "/forum/${topic_id}",
                success: function (result) {

                    $.each(result.data, function (i, messages) {

                        var listMessages = "<li class='list-group-item '>" +
                            "<div class='d-flex w-100 justify-content-between'><h5 class='mb-1'>" + messages.nameUser + "</h5></div>" +
                            "<p class='mb-1'> " + messages.textMessage + "</p></li>";
                        $("#listMessages").append(listMessages);

                    })

                },
                error: (function (e) {
                    alert("error view list messages" + e)
                })

            });
        }


    })
</script>
</html>

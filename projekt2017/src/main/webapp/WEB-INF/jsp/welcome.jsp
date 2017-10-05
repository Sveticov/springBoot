<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%--
  Created by IntelliJ IDEA.
  User: SVETICOV
  Date: 22.09.2017
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script src="/js/user%20login.js"></script>
    <script src="/js/list%20topic.js"></script>
    <title>Welcome</title>
</head>
<body>
<script>
    $(document).ready(function () {


        $("#nav-all-users").hide();
        $("#nav-all-edit-topics").hide();
        $("#nav-all-admin-registration").hide();
        $("#closeLogin").hide();
        $("#closeLogin2").show();
    })

</script>
<div class="container">
    <div class="row row-offcanvas row-offcanvas-right">
        <nav class="navbar navbar-toggleable-md fixed-top navbar-inverse bg-inverse">
            <div class="container">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item ">
                        <h1 class="navbar-brand">Welcome</h1>
                    </li>
                    <li class="nav-item active">
                        <button type="button" class="btn btn-link" data-toggle="modal" data-target="#loginModal">
                            login
                        </button>
                    </li>
                    <li class="nav-item">

                    </li>

                    <li class="nav-item">
                        <a href="/registration_user">
                            <button class="btn btn-link" type="button">Registration</button>
                        </a>
                    </li>
                    <li class="nav-item" id="nav-all-admin-registration">
                        <a href="/admin_registration">
                            <button class="btn btn-link" type="button">Registration Admin</button>
                        </a>
                    </li>
                    <li class="nav-item" id="nav-all-edit-topics">
                        <a href="/edit_topics">
                            <button class="btn btn-link" type="button">Edit Topics</button>
                        </a>
                    </li>
                    <li class="nav-item" id="nav-all-users">
                        <a href="/all_users">
                            <button class="btn btn-link" type="button">All Users</button>
                        </a>
                    </li>
                </ul>
            </div>

        </nav>

        <!--####################################################################################################-->
        <div class="jumbotron">
            <div class="container">
                <h1 class="display-3">Hello,
                    <p id="UserActualName"></p>
                    <p id="UserActualName2"></p>
                    <p id="UserActualId" hidden></p>
                    <p id="UserActualId2" hidden></p>
                </h1>

                <p><a class="btn btn-primary btn-lg" href="/welcome" id="btn-welcome" role="button">Reload form
                    &raquo;</a></p>
            </div>
        </div>
        <!--#########################################  Topic new add-->
        <%--<div class="modal fade" id="addTopicModal" role="dialog" aria-labelledby="addTopicModal"><!--tabindex="7"-->--%>
        <%--<div class="modal-dialog" role="document">--%>
        <%--<div class="modal-content">--%>
        <%--<div class="modal-header">--%>
        <%--<h5 class="modal-title" id="addTopicModalLabel">New topic</h5>--%>
        <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
        <%--<span aria-hidden="true">&times;</span>--%>
        <%--</button>--%>
        <%--</div>--%>
        <%--<div class="modal-body">--%>
        <%--<form>--%>

        <%--<div class="form-group">--%>
        <%--<label for="topic-name" class="form-control-label">Name:</label>--%>
        <%--<input type="text" class="form-control" id="topic-name"/>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
        <%--<label for="topic-description" class="form-control-label">Description:</label>--%>
        <%--<input type="text" class="form-control" id="topic-description"/>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
        <%--<button type="submit" class="btn btn-primary" id="topic-btn">Send</button>--%>
        <%--</div>--%>
        <%--</form>--%>
        <%--<div class="modal-footer">--%>
        <%--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<script>--%>
        <%--jQuery(document).ready(--%>
        <%--function ($) {--%>
        <%--$("#topic-btn").click(function (event) {--%>
        <%--var data = {}--%>
        <%--data["topic_name"] = $("#topic-name").val();--%>
        <%--data["description"] = $("#topic-description").val();--%>


        <%--$.ajax({--%>
        <%--type: "POST",--%>
        <%--contentType: "application/json",--%>
        <%--url: "/new_topic",--%>
        <%--data: JSON.stringify(data),--%>
        <%--dataType: 'json',--%>
        <%--success: function (data) {--%>
        <%--alert(data)--%>
        <%--},--%>
        <%--error: function (e) {--%>
        <%--alert("error")--%>
        <%--}--%>
        <%--});--%>
        <%--});--%>

        <%--}--%>
        <%--)--%>
        <%--</script>--%>
        <!--#########################################Modal Login-->
        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="loginModalLabel">Login</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="user-login-form" data-toggle="validator" role="form">
                            <div class="form-group">
                                <label for="user-login-name" class="form-control-label "
                                >User:</label>
                                <input type="text" class="form-control" id="user-login-name" placeholder="Username"
                                       pattern="^[_A-z0-9]{1,}$" required>
                                <p id="valid-name" style="color:red;"></p>
                            </div>
                            <div class="form-group">
                                <label for="user-login-password" class="form-control-label">Password:</label>
                                <input type="password" class="form-control" id="user-login-password"
                                       placeholder="Password" pattern="^[_A-z0-9]{1,}$" required>
                                <p id="valid-password" style="color:red;"></p>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary" id="user-login-btn">Send</button>

                            </div>
                        </form>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input type="checkbox" class="form-check-input" id="admin-user-check">
                                Admin
                            </label>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeLogin">Close
                            </button>

                            <a href="/welcome">
                                <button class="btn btn-secondary" id="closeLogin2">Close</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $("#user-login-btn").click(function () {
                    validation($("#user-login-name").val(), $("#user-login-password").val());
                });

            })

            function validation(nameV, passwordV) {
                var name, password;
                name = nameV;
                password = passwordV;

                if (name.length < 2) {
                    $("#valid-name").html("name mast by > 2");
                }
                if (name == "") {
                    $("#valid-name").html("filed empty");
                }

                if (password.length < 3) {
                    $("#valid-password").html("name mast by > 3");
                }
                if (password == "") {
                    $("#valid-password").html("filed empty");
                }

            }
        </script>
        <%--view topics list--%>
        <div class="container">
            <div class="row">
                <div class=" col-sm-4">
                    <div id="listTopic1"></div>
                </div>
                <div class=" col-sm-4">
                    <div id="listTopic2"></div>
                </div>
                <div class=" col-sm-4">
                    <div id="listTopic3"></div>
                </div>
            </div>
        </div>

        <hr>
        <footer>
            <p>&copy; Sveticov 2017</p>
        </footer>

    </div>
</div>
</body>


</html>

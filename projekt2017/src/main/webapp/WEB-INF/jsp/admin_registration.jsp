<%--
  Created by IntelliJ IDEA.
  User: SVETICOV
  Date: 29.09.2017
  Time: 19:33
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
    <script src="/js/admin%20registration.js"></script>
    <title>Admin Registration</title>
</head>
<body>


<div class="jumbotron">
    <div class="container">
        <div class="row">
            <div class="col-4">
                <h1 class="display-3">Registration</h1>

                <p>Please input yore Name and Password</p>
                <p><a class="btn btn-primary btn-lg" href="/welcome" id="btn-welcome" role="button">Learn more &raquo;</a></p>
            </div>
            <div class="col-8">
                <h1 class="display-3" id="AdminName"></h1>
            </div>

        </div>

    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-2"></div>
        <div class="col-4">
            <form id="registrationFormAdmin">
                <div class="form-group">
                    <label for="name-registration-admin" class="form-control-label">Name:</label>
                    <input class="form-control" type="text" id="name-registration-admin"/>
                </div>
                <div class="form-group">
                    <label for="password-registration-admin" class="form-control-label">Password:</label>
                    <input class="form-control" for="form-control" type="password" id="password-registration-admin"/>
                </div>
                <div class="form-group">
                    <label for="password-registration2-admin" class="form-control-label">Password:</label>
                    <input class="form-control" for="form-control" type="password" id="password-registration2-admin"/>
                </div>
                <div class="form-group">

                    <button type="submit" class="btn btn-primary animate pulse infinity ">Registration</button>

                </div>

            </form>
        </div>
        <div class="col-8"></div>
    </div>

</div>

</body>
</html>

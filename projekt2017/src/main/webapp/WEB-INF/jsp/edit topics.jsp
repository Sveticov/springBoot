<%--
  Created by IntelliJ IDEA.
  User: SVETICOV
  Date: 29.09.2017
  Time: 22:08
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
    <script src="/js/edit%20topic.js"></script>
    <title>Edit Topic</title>
</head>
<body>
<div class="jumbotron">
    <div class="container">
        <div class="row">
            <div class="col-4">
                <h1 class="display-3">Edit topic</h1>

                <p>Here add and delete topics</p>
                <p><a class="btn btn-primary btn-lg" href="/welcome" id="btn-welcome" role="button">Back to start page
                    &raquo;</a></p>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addTopicModal">
                    Add  new topic
                </button>
            </div>
            <div class="col-8">
                <h1 class="display-3" id="AdminName"></h1>
            </div>

        </div>

    </div>
</div>

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
<!--#########################################  Topic new add-->
<div class="modal fade" id="addTopicModal" role="dialog" aria-labelledby="addTopicModal"><!--tabindex="7"-->
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addTopicModalLabel">New topic</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>

                    <div class="form-group">
                        <label for="topic-name" class="form-control-label">Name:</label>
                        <input type="text" class="form-control" id="topic-name"/>
                    </div>
                    <div class="form-group">
                        <label for="topic-description" class="form-control-label">Description:</label>
                        <input type="text" class="form-control" id="topic-description"/>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary" id="topic-btn">Send</button>
                    </div>
                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    jQuery(document).ready(
        function ($) {
            $("#topic-btn").click(function (event) {
                var data = {}
                data["topic_name"] = $("#topic-name").val();
                data["description"] = $("#topic-description").val();


                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "/new_topic",
                    data: JSON.stringify(data),
                    dataType: 'json',
                    success: function (data) {
                        alert(data)
                    },
                    error: function (e) {
                        alert("error")
                    }
                });
            });

        }
    )
</script>

<hr>
<footer>
    <p>&copy; Sveticov 2017</p>
</footer>
</body>
</html>

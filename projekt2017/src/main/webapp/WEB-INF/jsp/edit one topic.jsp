<%--
  Created by IntelliJ IDEA.
  User: SVETICOV
  Date: 29.09.2017
  Time: 22:45
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
    <title>Edit one topic</title>
</head>
<body>
<div class="jumbotron">
    <div class="container">
        <div class="row">
            <div class="col-4">
                <h1 class="display-3">Edit topic</h1>

                <p>Here add and delete topics</p>
                <p><a class="btn btn-primary btn-lg" href="/edit_topics" id="btn-welcome" role="button">Back to start
                    page
                    &raquo;</a></p>
            </div>
            <div class="col-8">
                <h1 class="display-3" id="AdminName"></h1>
            </div>

        </div>

    </div>
</div>
<%--////////////////////////////////////////////--%>
<div class="container">
    <div class="container">
    <div class="row">
        <div class="col-md-4">
            <label class="label" for="label-id-topic-edit">Id:</label>
            <h1 id="label-id-topic-edit">${id_topic_edit}</h1>
        </div>
        <div class="col-md-4">
            <label class="label" for="label-name-topic-edit">Name:</label>
            <h1 id="label-name-topic-edit">${name_topic_edit}</h1>

        </div>
        <div class="col-md-4">
            <label class="label" for="label-description-topic-edit">Description:</label>
            <h5 id="label-description-topic-edit">${description_topic_edit}</h5>
        </div>
    </div>
    </div>
    <br/>
<div class="container">
    <div class="row">
        <%--<form >--%>
            <div class="col-md-2">
                <div class="form-group">
                <label class="label" for="update-id-topic-edit">Id:</label>
                <h1 id="update-id-topic-edit">${id_topic_edit}</h1>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                <label class="label" for="update-name-topic-edit">Edit Name:</label>
                <input type="text" class="form-control" id="update-name-topic-edit" placeholder="${name_topic_edit}">
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                <label class="label" for="update-description-topic-edit">Edit Description:</label>
                <textarea type="text" class="form-control" rows="7" id="update-description-topic-edit" placeholder="${description_topic_edit}"></textarea>
                </div>
            </div>
        <%--</form>--%>
    </div>
</div>
    <br/>
    <div class="container">
        <div class="inline">
            <a href="/delete_topic/${topic_id}">
                <button class="btn btn-primary" type="button">Delete</button>
            </a>

            <button id="btn-update-topic-edit" class="btn btn-primary" type="button">Edit</button>



        </div>
    </div>


</div>

<script>
    $(document).ready(function () {



        $("#btn-update-topic-edit").click(function (e) {
            e.preventDefault();
            updateTopic();
        })


        function updateTopic() {

            var dataUpdateTopic = {

                topic_name: $("#update-name-topic-edit").val(),
                description: $("#update-description-topic-edit").val()


            }
alert(dataUpdateTopic)
            $.ajax({
                url: "/update/${topic_id}",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(dataUpdateTopic),
                dataType: 'json',
                success: function (result) {
                    alert("success"+result.status+" "+result.data)
                },
                error: function (e) {
                    alert("error")
                }
            });

        }
    })
</script>
<hr>
<footer>
    <p>&copy; Sveticov 2017</p>
</footer>

</body>
</html>

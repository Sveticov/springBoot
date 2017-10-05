$(document).ready(function () {


    var chekingUserAdmin = false;

    $("#admin-user-check").change(function () {
        if (this.checked) {

            chekingUserAdmin = true;

        }
    })


    $("#user-login-form").submit(function (event) {
        event.preventDefault();

        clearUserFileds();
        if (chekingUserAdmin == false) {
            postFormLoginUser();


        }
        if (chekingUserAdmin != false) {
            postFormLoginAdmin();

        }


    });


    function postFormLoginUser() {
        var loginUserData = {
            name: $("#user-login-name").val(),
            password: $("#user-login-password").val()
        }

        $.ajax({
            type: "POST",
            url: "/loginUser",
            contentType: "application/json",
            data: JSON.stringify(loginUserData),
            dataType: 'json',
            success: function (result) {
                alert(result.status)
                if (result.status == "success") {


                    $("#UserActualName").html(result.data.name);


                    $("#UserActualId").html(result.data.user_id);

                }
                if (result.status == "error") {


                    $("#UserActualName").html(result.status + "  " + result.data);
                    alert(result.status + "  " + result.data)
                }
            },
            error: function (e) {
                alert("error user login " + e)
            }
        });
    }


    function postFormLoginAdmin() {
        var loginAdminData = {
            admin_name: $("#user-login-name").val(),
            admin_password: $("#user-login-password").val()
        }


        $.ajax({
            type: "POST",
            url: "/loginAdmin",
            contentType: "application/json",
            data: JSON.stringify(loginAdminData),
            dataType: 'json',
            success: function (result) {


                if (result.status == "success") {
                    alert("admin success")

                    $("#nav-all-users").show();
                    $("#nav-all-edit-topics").show();
                    $("#nav-all-admin-registration").show();
                    $("#closeLogin").show();
                    $("#closeLogin2").hide();

                    $("#UserActualName").html("Admin " + result.data.admin_name);


                    $("#UserActualId").html(result.data.admin_id);

                }
                if (result.status == "error") {

                    $("#activ-admin").val(false);
                    $("#UserActualName").html(result.status + "  " + result.data);
                    alert(result.status + "  " + result.data)
                }
            },
            error: function (e) {
                alert("error user login " + e)
            }
        });
    }


    function clearUserFileds() {
        $("#user-login-name").html("");
        $("#user-login-password").html("");
    }




})
var cv;

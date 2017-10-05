$(document).ready(function () {


    $("#registrationFormAdmin").submit(function (event) {
        event.preventDefault();
        passwordAdminControl();
    });


    function passwordAdminControl() {

        var pass1=$("#password-registration-admin").val();
        var pass2=$("#password-registration2-admin").val();
        if (pass2 == pass1) {
            postFormAdminRegistration();
        } else {
            $("#UserName").html("<p class='text-danger'>Password not equals</p>")
        };
    }


    function postFormAdminRegistration() {

        var adminRegistration = {
            admin_name: $('#name-registration-admin').val(),
            admin_password: $('#password-registration-admin').val()
        }

        $.ajax({
            type: "POST",
            url: "/formAdminRegistration",
            contentType: "application/json",
            data: JSON.stringify(adminRegistration),
            dataType: 'json',
            success: function (result) {

                $('#AdminName').html("Hello " + result.data.admin_name);

                if (result.status == "Error") {
                    alert(result.status)
                    $('#AdminName').html("<p class='text-danger'>" + result.data + "</p>");
                }
            },
            error: function (e) {
                alert("error " + e)
            }
        });

    }

})
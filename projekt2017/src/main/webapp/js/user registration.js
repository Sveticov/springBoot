$(document).ready(function () {


    $("#registrationFormUser").submit(function (event) {
        event.preventDefault();
        passwordControl();
    });


    function passwordControl() {

        var pass1=$("#password-registration").val();
        var pass2=$("#password-registration2").val();
        if (pass2 == pass1) {
            postFormUserRegistration();
        } else {
            $("#UserName").html("<p class='text-danger'>Password not equals</p>")
        };
    }


    function postFormUserRegistration() {

        var userRegistration = {
            name: $('#name-registration').val(),
            password: $('#password-registration').val()
        }

        $.ajax({
            type: "POST",
            url: "/formUserRegistration",
            contentType: "application/json",
            data: JSON.stringify(userRegistration),
            dataType: 'json',
            success: function (result) {
                // alert(result.data.name)
                $('#UserName').html("Hello " + result.data.name);

                if (result.status == "Error") {
                    alert(result.status)
                    $('#UserName').html("<p class='text-danger'>" + result.data + "</p>");
                }
            },
            error: function (e) {
                alert("error " + e)
            }
        });

    }

})
$(document).ready(function () {
    $('.btn-setting').on('click', () => {
        $('.side-menu').toggleClass("hide");
        $('.bodyContainer').toggleClass("slideLeft");
        $('.bodyContainer').toggleClass("widthEdit");
    });
    $('.btn-setting').on('click', () => {
        $('.setting-icon').toggleClass('fa-cog');
        $('.setting-icon').toggleClass('fa-spin');
        $('.setting-icon').toggleClass('fa-times');
    });
    /*------------------------------------------------------------*/

    $('#countrySelect').on("change", () => {
        var val = document.getElementById("countrySelect");
        if (val.value !== "None") {
            $('#citySelect').prop("disabled", false);
            var vdata = {
                value: val.value
            };
            $.ajax({
                url: "../cityReload",
                type: "POST",
                data: vdata,
                dataType: "json",
                succss: function (data, textStatus, jqXHR) {
                    $('#citySelect').append(data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    $('#citySelect').empty();
                    $('#citySelect').append("<option selected>Select City</option>");
                    $('#citySelect').append(jqXHR.responseText);
                }
            });
        } else {
            $('#citySelect').prop("disabled", true);
        }
    });
    $('#saveButton').on("click", () => {
        
          $("#myForm").submit(function (e) {
                e.preventDefault();
            });
     
        var fname = document.getElementById("first_name");
        var lname = document.getElementById("last_name");
        var username = document.getElementById("username");
        var email = document.getElementById("email");
        var pNum = document.getElementById("phoneNum");
        var age = document.getElementById("age");
        var address = document.getElementById("address"); 
        var country = document.getElementById("countrySelect");
        var city = document.getElementById("citySelect");
        var password = document.getElementById("password");
        var passwordConfirmation = document.getElementById("password_confirmation");
        var pPhoto = document.getElementById("customFile"); 
        
        let confirmPasswordError = true;
        $('#password_confirmation').keyup(function () {validateConfirmPasswrd();});
        function validateConfirmPasswrd() {
                let confirmPasswordValue = $('#password_confirmation').val();
                let passwrdValue = $('#password').val();
                if (passwrdValue !== confirmPasswordValue) {
                        $('#conpasscheck').show();
                        $('#conpasscheck').html("**Password Must Match");
                        $('#conpasscheck').css("color", "red");
                        confirmPasswordError = false;
                } else {
                        $('#conpasscheck').hide();
                }
        }

        if (confirmPasswordError  ===  true) {
            
            var editData = {
                firstname: $('#first_name').val(),
                lastname: $('#last_name').val(),
                phoneNum: $('#phoneNum').val(),
                userName: $('#username').val(),
                userEmail: $('#email').val(),
                age: $('#age').val(),
                address: $('#address').val(),
                countrySelect: $('#countrySelect').val(),
                citySelect: $('#citySelect').val(),
                password: $('#password').val(),
                customFile: $('#customFile').val()
            };
            
            $.ajax({
                url: "../editProfileData",
                type: "POST",
                data: editData,
                dataType: "json",
                success: function (data, textStatus, jqXHR) {
                    if (data.a.status){
                            $(".msgRow").empty();
                            $(".msgRow").html("Profile Updated");
                            $(".msgRow").attr("role", "alert");
                            $(".msgRow").addClass("alert alert-success");
                            if(data.a.type === 1){
                                setTimeout(function () {
                                    window.location = "JSP/admin/dashboard.jsp";
                                }, 1500);
                            }else{
                                setTimeout(function () {
                                    window.location = "JSP/client/home.jsp";
                                }, 1500);
                            }
                    }else{
                            $(".msgRow").empty();
                            $(".msgRow").html("Profile Update Failed");
                            $(".msgRow").attr("role", "alert");
                            $(".msgRow").addClass("alert alert-danger");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                      alert("Error Update-Server Error");
                }
            });
        }
    });
});




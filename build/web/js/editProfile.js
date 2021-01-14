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
        
// Pattern f JSP
        var fname = document.getElementById("first_name");
        var lname = document.getElementById("last_name");
        var username = document.getElementById("username");
        var email = document.getElementById("email");
        var pNum = document.getElementById("phoneNum");
        var age = document.getElementById("age");
        var address = document.getElementById("address"); // Null
        var country = document.getElementById("countrySelect");
        var city = document.getElementById("citySelect");
        var password = document.getElementById("password"); // Check For Confirm Password
        var passwordConfirmation = document.getElementById("password_confirmation");
        var pPhoto = document.getElementById("customFile"); // Null


        //Ajax Request and response
        if (confirmPasswordError == true) {

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
                    ////!
                    
                    if (data.a.status)
                        alert("Profile Updated");
                    else
                        alert("Failed Updated");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                      alert(errorThrown);
//                    alert(jqXHR.responseText);
                }


            });

        }
//        png -> avatar  if value =" "



//            
    });
    //Code Javascript To validate

    // Validate Confirm Password 

    let confirmPasswordError = true;
    $('#password_confirmation').keyup(function () {
        validateConfirmPasswrd();
    });
    function validateConfirmPasswrd() {
        let confirmPasswordValue =
                $('#password_confirmation').val();
        let passwrdValue =
                $('#password').val();
        if (passwrdValue != confirmPasswordValue) {
            $('#conpasscheck').show();
            $('#conpasscheck').html(
                    "**Password Must Match");
            $('#conpasscheck').css(
                    "color", "red");
            confirmPasswordError = false;
//                return false;
        } else {
            $('#conpasscheck').hide();
        }
    }




});




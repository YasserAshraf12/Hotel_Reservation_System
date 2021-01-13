$(document).ready(function() {
    $('.btn-setting').on('click', ()=>{
      $('.side-menu').toggleClass("hide");
      $('.bodyContainer').toggleClass("slideLeft");
      $('.bodyContainer').toggleClass("widthEdit");
    });

    $('.btn-setting').on('click', ()=>{
      $('.setting-icon').toggleClass('fa-cog');
      $('.setting-icon').toggleClass('fa-spin');
      $('.setting-icon').toggleClass('fa-times');
    });
    
    /*------------------------------------------------------------*/
    
    $('#countrySelect').on("change",()=>{
        var val = document.getElementById("countrySelect");
        if(val.value !== "None"){
            $('#citySelect').prop("disabled", false);
            var vdata = {
                value: val.value
            };
            $.ajax({
                url: "../cityReload",
                type: "POST",
                data: vdata,
                dataType: "json",
                succss: function(data, textStatus, jqXHR){
                    $('#citySelect').append(data);
                },
                error: function(jqXHR, textStatus, errorThrown){
                    $('#citySelect').empty();
                    $('#citySelect').append("<option selected>Select City</option>");
                    $('#citySelect').append(jqXHR.responseText);
                }
            });
        }else{
            $('#citySelect').prop("disabled", true);
        }
    });
    
    $('#saveButton').on("click", ()=>{
        // Pattern f JSP
        var fname = document.getElementById("first_name");
        var lname = document.getElementById("last_name");
        var username = document.getElementById("username");
        var email = document.getElementById("email");
        var pNum = document.getElementById("phoneNum");
        var age = document.getElementById("age");
        var address = document.getElementById("address");  // Null
        var country = document.getElementById("countrySelect");
        var city = document.getElementById("citySelect");
        var password = document.getElementById("password"); // Check For Confirm Password
        var passwordConfirmation = document.getElementById("password_confirmation");
        var pPhoto = document.getElementById("customFile"); // Null
        
        //Code Javascript To validate
        
        //Ajax Request and response
        
        var editData = {
            firstname: $('#first_name').val()
            
        };
        $.ajax({
            
        });
    });
});




$(document).ready(()=>{
    
    //Full Name Field Value.
    $('.lname, .fname').change(()=>{
        $('.fullname').attr("value", ($('.fname').val() + " " + $('.lname').val()));
    });
    
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
                success: function(data, textStatus, jqXHR){
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
    
    function submitUserForm(){
        var response = grecaptcha.getResponse();
        if(response.length == 0)
        {
            document.getElementById("g-recaptcha-error").innerHTML = '<span style="color: red;"> This Field is Required.</span>';
            return false;
        }
        return true;
    }
    
    function verifyCaptacha(){
         document.getElementById("g-recaptcha-error").innerHTML = '';
    }
});
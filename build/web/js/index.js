$(() => {
    $('a[href*="#"]:not([href="#"])').click((e) => {
      const target = $(e.target.hash);
  
      if (target.length) {
        $('html, body').animate({
          scrollTop: target.offset().top
        }, 1000);
  
        return false;
      }
    });
  });


(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();



$(document).ready(()=>{
    var cData = {
         x1: $("#usersCount").val(),
         x2: $("#hotelsCount").val(),
         x3: $('#bookingsCount').val()
    };
    
    $.ajax({
         url: "dataCheck",
         type: "GET",
         data: cData,
         dataType: "json",
         success: function(data,textStatus,jqXHR){
             $('#usersCount').html("");
             $('#usersCount').html(data.data.x1);

             $('#hotelsCount').html("");
             $('#hotelsCount').html(data.data.x2);

             $('#bookingsCount').html("");
             $('#bookingsCount').html(data.data.x3);

         },
         error: function(jqXHR, textStatus, errorThrown){
             alert("Failed Loading Data");
         }
    });
    
    
    $('#sendMail').on('click', function(){
        $("#myAjaxForm").submit(function(e){
            e.preventDefault();
        });
        
        var mdata = {
            fname: $('#fname').val(),
            email: $('#email').val(),
            password: $('#password').val(),
            phone: $('#phone').val(), 
            msg: $('#comment').val()
        };
        $.ajax({
            url: "sendMail",
            type: "POST",
            data: mdata,
            dataType: "json",
            success: function(data, textStatus, jqXHR){
                if(data.mail.status)
                    alert("Email Sent");
                else
                    alert("Email Not Sent");
            },
            error: function(jqXHR, textStatus, errorThrown){
                console.log(mdata);
                alert(jqXHR.responseText);
            }
        });
    });
});
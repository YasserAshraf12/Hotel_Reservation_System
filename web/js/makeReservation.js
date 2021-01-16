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


    $('#saveButton').on("click", () => {

        $("#myForm").submit(function (e) {
            e.preventDefault();
        });
        
        /*------------------------------------------------------------*/
//      validate dates 


        let confirmDateRange = true;
        $('#to_date').keyup(function () {
            validateDatesRange();
        });
        function validateDatesRange() {
//                let endDate = $('#to_date').val();
//                let startDate = $('#from_date').val();
//  
//                if (endDate >  startDate && startdate >duedate  ) {
//                        $('#dateRangecheck').show();
//                        $('#dateRangecheck').html("** date range isnt available");
//                        $('#dateRangecheck').css("color", "red");
//                        confirmPasswordError = false;
//                } else {
//                        $('#dateRangecheck').hide();
//                }
        }
//
//        if (confirmDateRange  ===  true) {
//           room_Number hotel_name to_date from_date            
        var editData = {
//            roomnumber: $('#room_Number').val(),
//            hotelname: $('#hotel_name').val(),
            todate: $('#to_date').val(),
            fromdate: $('#from_date').val(),
            roomid: $('#room_ID').val(),
            hotelid: $('#hotel_ID').val()
        };

        $.ajax({
            url: "../../makeReservation",
            type: "POST",
            data: editData,
            dataType: "json",
            success: function (data, textStatus, jqXHR) {
                if (data.a.status) {
                    $(".msgRow").empty();
                    $(".msgRow").html("booking done successfully");
                    $(".msgRow").attr("role", "alert");
                    $(".msgRow").addClass("alert alert-success");
                    setTimeout(function () {
                        window.location = "JSP/client/roomTable.jsp";
                    }, 1500);

                } else {
                    $(".msgRow").empty();
                    $(".msgRow").html("booking Failed");
                    $(".msgRow").attr("role", "alert");
                    $(".msgRow").addClass("alert alert-danger");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
//                alert("Error Update-Server Error");
                    alert(jqXHR.responseText);
            }
        });
//        }
    });
});




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
        


        let confirmDateRange = true;
        $('#to_date').keyup(function () {
            validateDatesRange();
        });
        function validateDatesRange() {

        }
         
        var editData = {

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

            alert(data.a);
                    setTimeout(function () {
                        window.location = "roomTable.jsp?id="+parseInt(editData.hotelid);
                    }, 1500);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
            }
        });

    });
});




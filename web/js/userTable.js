$(document).ready(function() {
    document.title='Life Trip';
    $('#example').DataTable(
        {
            "dom": '<"dt-buttons"Bf><"clear">lirtp',
            "paging": true,
            "autoWidth": true,
            "rowReorder": true,
            "fixedHeader": true,
            "select": true,
            "buttons": [
                'copyHtml5',
                'excelHtml5',
                'csvHtml5',
                'pdfHtml5',
                'print'
            ],
        }
    );
});

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
    })
});

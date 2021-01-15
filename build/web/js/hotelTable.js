$(document).ready(function() {
    document.title='Life Trip';
    var table =  $('#example').DataTable(
        {
            dom: '<"dt-buttons"Bf><"clear">lirtp',
            paging: true,
            autoWidth: true,
            responsive: true,
            buttons: [
                'copyHtml5',
                'excelHtml5',
                'csvHtml5',
                'pdfHtml5',
                'print'
            ]
        });

    $('a.toggle-vis').on( 'click', function (e) {
        e.preventDefault();
        var column = table.column( $(this).attr('data-column') );
        column.visible( ! column.visible() );
    });
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
    });
});


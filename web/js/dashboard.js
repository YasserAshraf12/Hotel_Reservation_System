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


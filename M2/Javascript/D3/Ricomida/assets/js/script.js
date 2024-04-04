$(function () {
    // Inicializar todos los tooltips
    var tooltips = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    tooltips.forEach(function(tooltip) {
        new bootstrap.Tooltip(tooltip);
    });
    
    $('[data-toggle="tooltip"]').tooltip();

    $('#enviarCorreo').click(function (){
        alert("El correo fue enviado correctamente...")
    });

    $('body').on('dblclick','h4',function () {
        $(this).css("color",'red');
    });

    $('.card-title').click(function(){
        $('.card-text').toggle();
    });
});
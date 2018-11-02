
$(document).ready(function(){
    if ($('form.form-validate').length <= 0) {
        window.formInited = true;
    }
    window.formInitTimer = setInterval(function() {
        if (typeof(window.formInited) !== 'undefined') {
            $('#page-loading').remove();
            clearInterval(window.formInitTimer);
        } else {
            //$('#page-loading').show();
        }
    },
    1);
})

//shop_cube
$(function() {
    $( "#tbody" ).sortable();
    $( "#tbody" ).disableSelection();
});
//shop_cube

// recommand
$(function() {
    var title = '';
    $('.img-nickname').each(function() {
        title += $(this).html() + ';';
    });
    $('#goodsid_text').val(title);
})
$('.multi-img-details').sortable();
// recommand








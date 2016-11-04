$(document).ready(function() {

//    BEGIN ajax add category to ptoduct
    $(document).on( "click", "#product_category_id", function() {
        $('#twocategory').html('<img src="/loading.gif" alt=""/>');
         $.ajax({
            url: '/products/form_render',
            type: 'POST',
            data: $(this).serialize(),
            success: function(result){
                if(result == '') $('#twocategory' && '#threecategory').html(result);
                $('#twocategory').html(result);
                $('#threecategory').html('');
                console.log(result);
            }
        });
    });

$(document).on( "click", "#product_twocategory_id", function() {
    $('#threecategory').html('<img src="/loading.gif" alt=""/>');
    $.ajax({
        url: '/products/form_render',
        type: 'POST',
        data: $(this).serialize(),
        success: function(result){
            $('#threecategory').html(result);
            console.log(result);
        }
    });
});
//    END ajax add category to ptoduct

//BEGIN fancybox
    $(".gallery").fancybox({
        parent: 'body',
        'transitionIn' : 'none',
        'transitionOut' : 'none',
        'prevEffect'  : 'fade',
        'nextEffect'  : 'fade'
    });
//END fancybox

});

$(document).on('ready turbolinks:load', function(){
    $('.autoplay').not('.slick-initialized').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        pauseOnHover: false,
        adaptiveHeight: true,
        arrows: false,
        autoplaySpeed: 2000
    });

});

$(document).on('ready turbolinks:load', function(){
    $('.s1').not('.slick-initialized').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        pauseOnHover: false,
        adaptiveHeight: true,
        arrows: false,
        autoplaySpeed: 4000,
        vertical: true
    });

});


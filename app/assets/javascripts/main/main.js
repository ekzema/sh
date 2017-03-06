$(document).ready(function() {

//    BEGIN ajax add category to ptoduct
    var img_load = '<center><img src="/loading.gif" alt=""/></center>';
    $(document).on( "click", "#product_category_id", function() {
        $('#twocategory').html(img_load);
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
    $('#threecategory').html(img_load);
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


//    BEGIN ajax add category to ptoduct_admin
    $(document).on( "click", ".product_category_id", function() {
        $('#twocategory').html(img_load);
        $.ajax({
            url: '/admin_panel/form_render',
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

    $(document).on( "click", ".product_twocategory_id", function() {
        $('#threecategory').html(img_load);
        $.ajax({
            url: '/admin_panel/form_render',
            type: 'POST',
            data: $(this).serialize(),
            success: function(result){
                $('#threecategory').html(result);
                console.log(result);
            }
        });
    });
//    END ajax add category to ptoduct_admin

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
        autoplaySpeed: 6000
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

$(document).on('ready turbolinks:load', function(){
    $('.auto').not('.slick-initialized').slick({
        slidesToShow: 8,
        slidesToScroll: 1,
        autoplay: true,
        pauseOnHover: false,
        adaptiveHeight: true,
        arrows: false,
        autoplaySpeed: 2500
    });

});

$(document).on('ready turbolinks:load', function(){
    $('.auto1').not('.slick-initialized').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: true,
        pauseOnHover: false,
        adaptiveHeight: true,
        arrows: false, 
        autoplaySpeed: 4000
    });

});

$(document).on('ready turbolinks:load', function(){
    $('.auto2').not('.slick-initialized').slick({
        slidesToShow: 2,
        slidesToScroll: 1,
        autoplay: true,
        pauseOnHover: false,
        adaptiveHeight: true,
        arrows: false,
        autoplaySpeed: 4000
    });

});

$(document).on('ready turbolinks:load', function(){
    $('.auto3').not('.slick-initialized').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: true,
        pauseOnHover: false,
        adaptiveHeight: true,
        arrows: false,
        autoplaySpeed: 2500
    });

});

$(document).on('ready turbolinks:load', function(){
    $('.autoplayproduct').not('.slick-initialized').slick({
        slidesToShow: 8,
        slidesToScroll: 1,
        autoplay: true,
        pauseOnHover: false,
        adaptiveHeight: true,
        arrows: false,
        autoplaySpeed: 5000
    });

});

$(document).on('ready turbolinks:load', function(){
    $('.autoplaydr').not('.slick-initialized').slick({
        vertical: true,
        slidesToShow: 5,
        slidesToScroll: 1,
        autoplay: true,
        pauseOnHover: false,
        adaptiveHeight: true,
        arrows: false,
        autoplaySpeed: 6000
    });

});
$(document).ready(function() {

//    BEGIN ajax add category to ptoduct
    var img_load = '<center><img src="/loading.gif" alt=""/></center>';
    $(document).on( "change", "#product_category_id", function() {
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

$(document).on( "change", "#product_twocategory_id", function() {
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
    $(document).on( "change", ".product_category_id", function() {
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

    $(document).on( "change", ".product_twocategory_id", function() {
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
    $('.list-toggle').click(function(){
        $('.u-list').toggleClass('open');
    });
});





$(document).on('ready turbolinks:load', function(){
    $('.home_slider_product').not('.slick-initialized').slick({
        vertical: true,
        slidesToShow: 2,
        slidesToScroll: 1,
        autoplay: true,
        pauseOnHover: false,
        adaptiveHeight: true,
        arrows: false,
        autoplaySpeed: 1500
    });

});

$(document).on('ready turbolinks:load', function(){
    $('.home_slider_user').not('.slick-initialized').slick({
        vertical: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        autoplay: true,
        pauseOnHover: false,
        adaptiveHeight: true,
        arrows: false,
        autoplaySpeed: 1500
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
        slidesToShow: 5,
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
        slidesToShow: 3,
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
        autoplaySpeed: 5000
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
    $('.autoplayproduct2').not('.slick-initialized').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: true,
        pauseOnHover: false,
        adaptiveHeight: true,
        arrows: false,
        autoplaySpeed: 7000
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

$(document).on('ready turbolinks:load', function(){
    $('.productseller').not('.slick-initialized').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: true,
        pauseOnHover: false,
        adaptiveHeight: true,
        arrows: false,
        autoplaySpeed: 5000
    });

});

$(document).on('ready turbolinks:load', function(){
    $('.productseller2').not('.slick-initialized').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: true,
        pauseOnHover: false,
        adaptiveHeight: true,
        arrows: false,
        autoplaySpeed: 6000
    });

});


$(document).on('turbolinks:load', function() {
    $('form').parsley().validate();
});


 //date
var d = new Date(90,0,1);
document.addEventListener("turbolinks:load", function() {

    $( "#datepicker" ).datepicker({
        defaultDate:d, //set the default date to Jan 1st 1990
        changeMonth: true,
        changeYear: true,
        yearRange: '1966:2000', //set the range of years
        dateFormat: 'dd-mm-yy' //set the format of the date

    });
    $.datepicker.regional['ru'] = {
        closeText: 'Закрыть',
        prevText: '&#x3c;Пред',
        nextText: 'След&#x3e;',
        currentText: 'Сегодня',
        monthNames: ['Январь','Февраль','Март','Апрель','Май','Июнь',
            'Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь'],
        monthNamesShort: ['Янв','Фев','Мар','Апр','Май','Июн',
            'Июл','Авг','Сен','Окт','Ноя','Дек'],
        dayNames: ['воскресенье','понедельник','вторник','среда','четверг','пятница','суббота'],
        dayNamesShort: ['вск','пнд','втр','срд','чтв','птн','сбт'],
        dayNamesMin: ['Вс','Пн','Вт','Ср','Чт','Пт','Сб'],
        dateFormat: 'dd.mm.yy',
        firstDay: 1,
        isRTL: false
    };
    $.datepicker.setDefaults($.datepicker.regional['ru']);

    $('input.datepicker').datepicker({
        showOn: 'both',
        buttonImageOnly: true,
        buttonImage: '/images/026.png'
    });


$('.searchInput').autocomplete({
    minLength: 3,
    delay: 600,
    source: '/search/autocomplete.json'
});
$('.ui-helper-hidden-accessible').hide(); //hide result message in div classes ui-helper-hidden-accessible
});

document.addEventListener("turbolinks:load", function () {
    $('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
        event.preventDefault();
        event.stopPropagation();
        $(this).parent().siblings().removeClass('open');
        $(this).parent().toggleClass('open');
    });
});

function addToFavorite(id) {
    $('.favItem').html("<img src='/loading-favorite.gif'>");
    $.ajax({
        url: '/favorites',
        type: 'POST',
        data: {product_id: id},
        success: function(result){
            if (result.success) {
                $('.favoritesCount').html(result.count)
                $('.favoriteButton').html("Удалить из <span class='favItem btn-custom glyphicon glyphicon-heart-empty' onclick='removeToFavorite("+result.id+")'>избранного</span>");
                $('#notice').html("<div class='alert alert-success' role='alert'>"+result.message+"</div>");
                setTimeout("$('.alert').fadeOut(1000);", 4000);
                setTimeout("$('.alert').remove();", 5000);
            } else {
                $('#notice').html("<div class='alert alert-danger' role='alert'>"+result.message+"</div>");
                setTimeout("$('.alert').fadeOut(1000);", 4000);
                setTimeout("$('.alert').remove();", 5000);
            }
        }
    });
}

function removeToFavorite(id){
    $('.favItem').html("<img src='/loading-favorite.gif'>");
    $.ajax({
        url: '/favorites/'+id,
        type: 'delete',
        data: {product_id: id},
        success: function(result){
            if (result.success) {
                $('.favoritesCount').html(result.count)
                $('.favoriteButton').html("Добавить в <span class='favItem btn-custom glyphicon glyphicon-heart-empty' onclick='addToFavorite("+result.id+")'>избранное</span>");
                $('#notice').html("<div class='alert alert-success' role='alert'>"+result.message+"</div>");
                setTimeout("$('.alert').fadeOut(1000);", 4000);
                setTimeout("$('.alert').remove();", 5000);
            } else {
                $('#notice').html("<div class='alert alert-danger' role='alert'>"+result.message+"</div>");
                setTimeout("$('.alert').fadeOut(1000);", 4000);
                setTimeout("$('.alert').remove();", 5000);
            }
        }
    });
}





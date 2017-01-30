function initializeJS() {

    //tool tips
    jQuery('.tooltips').tooltip();

    //popovers
    jQuery('.popovers').popover();

    //custom scrollbar
        //for html

    document.addEventListener("turbolinks:load", function() {
        $("html").getNiceScroll().remove()
        $("html").niceScroll({
            styler: "fb",
            cursorcolor: "#007AFF",
            cursorwidth: '6',
            cursorborderradius: '10px',
            background: '#F7F7F7',
            cursorborder: '',
            zindex: '1000'
        });
    });

        //for sidebar
    jQuery("#sidebar").niceScroll({styler:"fb",cursorcolor:"#007AFF", cursorwidth: '3', cursorborderradius: '10px', background: '#F7F7F7', cursorborder: ''});
        // for scroll panel
    jQuery(".scroll-panel").niceScroll({styler:"fb",cursorcolor:"#007AFF", cursorwidth: '3', cursorborderradius: '10px', background: '#F7F7F7', cursorborder: ''});

    //sidebar dropdown menu
    jQuery('#sidebar .sub-menu > a').click(function () {
        var last = jQuery('.sub-menu.open', jQuery('#sidebar'));
        jQuery('.menu-arrow').removeClass('arrow_carrot-right');
        jQuery('.sub', last).slideUp(200);
        var sub = jQuery(this).next();
        if (sub.is(":visible")) {
            jQuery('.menu-arrow').addClass('arrow_carrot-right');
            sub.slideUp(200);
        } else {
            jQuery('.menu-arrow').addClass('arrow_carrot-down');
            sub.slideDown(200);
        }
        var o = (jQuery(this).offset());
        diff = 200 - o.top;
        if(diff>0)
            jQuery("#sidebar").scrollTo("-="+Math.abs(diff),500);
        else
            jQuery("#sidebar").scrollTo("+="+Math.abs(diff),500);
    });

    // sidebar menu toggle
    jQuery(function() {
        function responsiveView() {
            var wSize = jQuery(window).width();
            if (wSize <= 768) {
                jQuery('#container').addClass('sidebar-close');
                jQuery('#sidebar > ul').hide();
            }

            if (wSize > 768) {
                jQuery('#container').removeClass('sidebar-close');
                jQuery('#sidebar > ul').show();
            }
        }
        jQuery(window).on('load', responsiveView);
        jQuery(window).on('resize', responsiveView);
    });

    document.addEventListener("turbolinks:load", function() {
        jQuery('.toggle-nav').click(function () {
            if (jQuery('#sidebar > ul').is(":visible") === true) {
                jQuery('#main-content').css({
                    'margin-left': '0px'
                });
                jQuery('#sidebar').css({
                    'margin-left': '-180px'
                });
                jQuery('#sidebar > ul').hide();
                jQuery("#container").addClass("sidebar-closed");
            } else {
                jQuery('#main-content').css({
                    'margin-left': '180px'
                });
                jQuery('#sidebar > ul').show();
                jQuery('#sidebar').css({
                    'margin-left': '0'
                });
                jQuery("#container").removeClass("sidebar-closed");
            }
        });
    });

    //bar chart
    if (jQuery(".custom-custom-bar-chart")) {
        jQuery(".bar").each(function () {
            var i = jQuery(this).find(".value").html();
            jQuery(this).find(".value").html("");
            jQuery(this).find(".value").animate({
                height: i
            }, 2000)
        })
    }

}

jQuery(document).ready(function(){
    initializeJS();
});

$(document).on('ready turbolinks:load', function(){
        $('.deleteMessage').on("click", function(){
            var id = $(this).attr("seller_id");
            $.confirm({
                confirmButton: 'Да',
                cancelButton: 'Нет',
                title: 'Подтверждение!',
                content: 'Вы уверены что хотите удалить ПРОДАВЦА?',
                confirm: function(){
                    $.ajax({
                        type: "DELETE",
                        url: "/admin_panel/delete_seller",
                        data: "seller_id="+id,
                        dataType: "html",
                        cache: false,
                        success: function(data) {
                            if (data == "ok")
                            {
                                $('#seller_'+id).hide(700);
                            }
                        }
                    });
                }
            });
        });
    });

$(document).on('ready turbolinks:load', function(){
    $('.deleteMessage2').on("click", function(){
        var id = $(this).attr("product_id");
        $.confirm({
            confirmButton: 'Да',
            cancelButton: 'Нет',
            title: 'Подтверждение!',
            content: 'Вы уверены что хотите удалить ТОВАР?',
            confirm: function(){
                $.ajax({
                    type: "DELETE",
                    url: "/admin_panel/delete_product",
                    data: "product_id="+id,
                    dataType: "html",
                    cache: false,
                    success: function(data) {
                        if (data == "ok")
                        {
                            $('#product_'+id).hide(700);
                        }
                    }
                });
            }
        });
    });
});
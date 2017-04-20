function initializeJS() {

    //    BEGIN ajax add category to ptoduct_admin

    var img_load = '<center><img src="/loading.gif" alt=""/></center>';
    $(document).on( "change", "#product_category_id", function() {
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

    $(document).on( "change", "#product_twocategory_id", function() {
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

    jQuery(function () {
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

    document.addEventListener("turbolinks:load", function () {
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


$(document).on('ready turbolinks:load', function () {

    $('.deleteMessage2').on("click", function () {
        var id = $(this).attr("orr_id");
        var accon = $(this).attr("accon");
        $.confirm({
            confirmButton: 'Да',
            cancelButton: 'Нет',
            title: 'Подтверждение!',
            content: 'Вы уверены что хотите удалить эту запись?',
            confirm: function () {
                $.ajax({
                    type: "delete",
                    url: "/" + accon + "/" + id,
                    data: "id=" + id,
                    cache: false,
                    success: function (data) {
                        if (data == "ok") {
                            $('#product_' + id).hide(700);
                        }
                    }
                });
            }
        });
    });
});

// $(document).on('ready turbolinks:load', function () {
//
//     $('.deleteMessage').on("click", function(){
//         var id = $(this).attr("seller_id");
//         $.confirm({
//             confirmButton: 'Да',
//             cancelButton: 'Нет',
//             title: 'Подтверждение!',
//             content: 'Вы уверены что хотите удалить ПРОДАВЦА?',
//             confirm: function(){
//                 $.ajax({
//                     type: "DELETE",
//                     url: "/admin_panel/delete_seller",
//                     data: "id="+id,
//                     dataType: "html",
//                     cache: false,
//                     success: function(data) {
//                         if (data == "ok")
//                         {
//                             $('#seller_'+id).hide(700);
//                         }
//                     }
//                 });
//             }
//         });
//     });
// });


jQuery(document).ready(function () {
    initializeJS();
});


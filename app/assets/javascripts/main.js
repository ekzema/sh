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

});




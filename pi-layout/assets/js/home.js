$(document).ready(function () {
    $(".sp-dong-thuan .moreBox").slice(0, 12).show();
    $(".sp-danh-cho-ban .moreBox").slice(0, 12).show();
    if ($(".sp-danh-cho-ban .moreBox:hidden").length != 0) {
        $("#loadmore3").show();
    }
    if ($(".sp-dong-thuan .moreBox:hidden").length != 0) {
        $("#loadmore3").show();
    }
    $("#loadmore3").on('click', function (e) {
        e.preventDefault();
        $(".sp-danh-cho-ban .moreBox:hidden").slice(0, 6).slideDown();
        if ($(".sp-danh-cho-ban .moreBox:hidden").length == 0) {
            $("#loadmore3").fadeOut('slow');
        }
    });
    $("#loadmore2").on('click', function (e) {
        e.preventDefault();
        $(".sp-dong-thuan .moreBox:hidden").slice(0, 6).slideDown();
        if ($(".sp-dong-thuan .moreBox:hidden").length == 0) {
            $("#loadmore2").fadeOut('slow');
        }
    });
});

$(function () {
    //$('.owl-carousel-video').owlCarousel({

    //});
    var videoSlider = $('.owl-carousel-video');

    videoSlider.owlCarousel({
        //loop: true,
        //margin: 0,
        //nav: true,
        //dots: true,
        //items: 1
        items: 1, nav: true,
        merge: true,
        loop: true, autoplay: false,
        margin: 10,
        videoWidth: true, // Default false; Type: Boolean/Number
        videoHeight: 500, // Default false; Type: Boolean/Number
        //video: true,
        //lazyLoad: true,
        center: true,
        responsive: {
            480: {
                items: 1
            },
            600: {
                items: 1
            }
        },
        //onRefreshed: adjustStretchHeader
    });
    
    videoSlider.on('translated.owl.carousel', function (e) {
        // check: does the slide have a video?
        //$('#video-home-page-1 .owl-item').find('video').pause();
        $('#video-home-page-1 video').each(function (i, obj) {
            $(this).get(0).pause();
        });
        if ($('.owl-item.active').find('video').length !== 0) {
            // play video in active slide
            $('#video-home-page-1 .owl-item.active .item-video video').get(0).play();
        }
    });



    $('.owl-carousel-product').owlCarousel({
        loop: true,
        margin: 10, dots: false, autoplay: true,
        nav: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 3
            },
            1000: {
                items: 6
            }
        }
    });
});
function adjustStretchHeader() {
    
}
//$(window).on('load', function () {
//    $("#first-video-1").get(0).play();
//})
jQuery(window).load(function () {
    $("#first-video-1").get(0).play();
});
document.addEventListener("DOMContentLoaded", function (event) {
   
});
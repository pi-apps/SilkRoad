//active menu gian hàng
/**
   * Mobile nav toggle
   */
const select = (el, all = false) => {
    el = el.trim()
    if (all) {
        return [...document.querySelectorAll(el)]
    } else {
        return document.querySelector(el)
    }
}
$(document).on('click', '#sub-menu-gian-hang-mobile', function (e) {
    select('#navbar1').classList.toggle('navbar-mobile');
    this.classList.toggle('bi-list');
    this.classList.toggle('bi-x');
})

/**
 * Mobile nav dropdowns activate
 */
$(document).on('click', '.navbar1 .dropdown > a', function (e) {
    if (select('#navbar1').classList.contains('navbar-mobile')) {
        e.preventDefault()
        this.nextElementSibling.classList.toggle('dropdown-active')
    }
});
$(function () {
    $("li.menu-level-1").mouseover(function () {
        //alert("");
        $("#header").css("height", "270px");
    });
    $("li.menu-level-1 > a").mouseover(function () {
        //alert("");
        $("#header").css("height", "270px");
    });
    $("#navbar").mouseout(function () {
        //$(".menu-new-2").hide(); 
        //$("#header").css("height", "90px");
    });
    $(".menu-new-2").mouseenter(function () {
        $("#header").css("height", "270px");
    }).mouseleave(function () {
        $("#header").css("height", "90px");
    });
});



if ($("#menu-gian-hang").length > 0) {
    var IdMenuGianHang = $("#hdfMenuGianhang").val();
    $("#menu-gian-hang li a").attr("class", "");
    $("#menu-gian-hang li a#menu-gian-hang-" + IdMenuGianHang).attr("class", "active");
}
$(".menu-mobile-website-level2").hide();
$(document).on("click", ".menu-mobile-website > li > i.fa-plus", function (e) {
    $(".menu-mobile-website-level2").hide();
    $(this).parent().find(".menu-mobile-website-level2").show();
    $(this).attr("class", "fa fa-minus");
});
$(document).on("click", ".menu-mobile-website > li > i.fa-minus", function (e) {
    $(".menu-mobile-website-level2").hide();
    $(this).attr("class", "fa fa-plus");
});

$(document).on("click", ".menu-mobile-website > li > a", function (e) {
    if ($(this).parent().find(".menu-mobile-website-level2").length > 0) {
        if ($(this).parent().find(".fa-plus").length > 0) {
            $(".menu-mobile-website-level2").hide();
            $(this).parent().find(".menu-mobile-website-level2").show();
            $(this).parent().find(".fa-plus").attr("class", "fa fa-minus");
        }
        else {
            $(".menu-mobile-website-level2").hide();
            $(this).parent().find(".fa-minus").attr("class", "fa fa-plus");
        }
    }
});
$(document).on("click", ".btn-subscribe-email-footer", function (e) {
    var email = $("#input-subscribe-email-footer").val();
    if (email == "") {
        $("#input-subscribe-email-footer").attr("style", "border:2px solid #FF6060");
    }
    else if (!validateEmail(email)) {
        $("#input-subscribe-email-footer").attr("style", "border:2px solid #FF6060");
    }
    else {
        $("#input-subscribe-email-footer").attr("style", "border:2px solid #979797");
        $.ajax({
            url: '/transaction/subscribeEmail.aspx',
            data: { email: email }, //data
            type: 'POST',
            success: function (data) {
                $("#input-subscribe-email-footer").val("");
                $("#input-subscribe-email-footer").attr("style", "border:2px solid #1fa67a");
            },
            error: function (jxhr, msg, err) {
            }
        });
    }

});
if ($("#hdfMainPageId").length > 0) {
    var menuMainId = $("#hdfMainPageId").val();
    $("#menu-main-menu li.mmenu-1 a").attr("class", "nav-link");
    $("#menu-main-menu li.mmenu-1 a#menu-top-" + menuMainId).attr("class", "nav-link active");
}
function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}
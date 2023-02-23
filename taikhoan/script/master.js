function confirmDelete() {
    if (confirm('Bạn có chắc muốn xóa dữ liệu này không?')) return true;
    return false;
}
function confirmCopy() {
    if (confirm('Bạn có chắc muốn sao chép dữ liệu này không?')) return true;
    return false;
}
function removeElement(s) {
    if (document.getElementById(s).style.display == "none") {
        document.getElementById(s).style.display = "block";
    }
    else {
        document.getElementById(s).style.display = "none";
    }
}
function change_alias(str) {
    str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
    str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
    str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
    str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
    str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
    str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
    str = str.replace(/đ/g, "d");
    str = str.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g, "A");
    str = str.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g, "E");
    str = str.replace(/Ì|Í|Ị|Ỉ|Ĩ/g, "I");
    str = str.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g, "O");
    str = str.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g, "U");
    str = str.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g, "Y");
    str = str.normalize("NFD");
    str = str.replace(/[\u0300-\u036f]/g, "");
    str = str.replace(/đ/g, "d");
    str = str.replace(/Đ/g, "d");
    str = str.replace(/ /g, "-");
    str = str.replace(/“|--|”|’|\.|$|,/g, "");
    str = str.trim().toLowerCase(); 
    return str;
}
$(document).on("keyup", ".txtNameJs", function (e) {
    $(".UrlSeoJs").val(change_alias($(this).val()));
})
//file upload
$(document).on("change", ".txt1 input[type=file]", function (e) {
    $image = $(this).next().find("img");
    console.log($image);
    if (typeof (FileReader) != "undefined")
    {
        var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
        $($(this)[0].files).each(function (i, j) {
            var file = $(this);
            if (regex.test(file[0].name.toLowerCase())) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $image.attr("src", e.target.result);
                }
                reader.readAsDataURL(file[0]);
            } else {
                alert(file[0].name + " không phải là một tập tin hình ảnh hợp lệ.");
                return false;
            }
        });
    } else {
        alert("Trình duyệt này không hỗ trợ HTML5 FileReader.\r\n Vui lòng sử dụng trình duyệt khác, hoặc nâng cấp trình duyệt của bạn");
    }
})
// script đánh dấu trang
var menuElem_id = 0;
function menuElem() {
    menuElem_id = document.getElementById('content_hdfidpage').value;
    if (menuElem_id != 0) {
        var item = 'pageID_' + menuElem_id;
        $("#" + item + "").addClass('selected');
        $("#" + item + "").parent().parent().parent().find("a:first").addClass('selected_open');
        // Gọi hàm open group
        // Có 2 trường hợp

        //1 if là trang mà có dmcap1
        var itemChild = 'PageChild_' + menuElem_id;
        var parentChild = document.getElementById(itemChild).innerHTML;
        if (parentChild == 1) {//Trang này là con của dmcap1

            //Mở folder cấp 1
            var itemparentCap1 = 'Parentid_' + menuElem_id;
            var parentidcap1 = document.getElementById(itemparentCap1).innerHTML;
            removeElement(parentidcap1);

            //Mở folder cha
            var itemparent = 'Parentid_' + parentidcap1;
            var parentid = document.getElementById(itemparent).innerHTML;
            removeElement(parentid);
        }
        else {
            // Trang này ko có dmcap1
            var itemparent = 'Parentid_' + menuElem_id;
            var parentid = document.getElementById(itemparent).innerHTML;
            removeElement(parentid);
        }
    }
}
//$(document).on("blur", ".imgChange", function (e) {
//    var value = $(this).val();
//    alert(value)
//})
function LoadTinyMCE() {
    tinymce.init({
        selector: "textarea.description",
        width: '99%',
        height: 450,

        fix_list_elements: true,
        schema: 'html5',
        entity_encoding: "raw", moxiemanager_fullscreen: true,
        external_plugins: {
            'moxiemanager': '/taikhoan/moxiemanager/plugin.min.js'

        },
        content_css: "/taikhoan/css/stylesheet.css",
        //toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | forecolor fontsizeselect | preview link image media insertfile',
        plugins: [
            'moxiemanager advlist autolink lists link image charmap print preview hr anchor pagebreak',
            'searchreplace wordcount visualblocks visualchars code fullscreen',
            'insertdatetime media nonbreaking save table contextmenu directionality',
            'emoticons template paste textcolor colorpicker textpattern imagetools codesample toc fullpage'
        ],
        toolbar1: 'undo redo | insert | styleselect | bold italic underline | hr alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link unlink image',
        toolbar2: 'fontselect |  fontsizeselect | forecolor backcolor emoticons | print preview media | codesample | insertfile | fullpage | fullscreen',
        fontsize_formats: "8px 9px 10px 11px 12px 13px 14px 15px 16px 17px 18px 19px 20px 21px 22px 23px 24px 25px 26px 27px 28px 29px 30px 31px 32px 33px 34px 35px 36px 37px 38px 39px 40px 41px 42px 43px 44px 45px 46px 47px 48px 49px 50px",
        font_formats: 'Roboto=roboto,arial,helvetica,sans-serif;Open Sans=open sans,arial,helvetica,sans-serif;Roboto Slab=roboto slab,arial,helvetica,sans-serif;Andale Mono=andale mono,times;Arial=arial,helvetica,sans-serif;Arial Black=arial black,avant garde;Book Antiqua=book antiqua,palatino;Comic Sans MS=comic sans ms,sans-serif;Courier New=courier new,courier;Georgia=georgia,palatino;Helvetica=helvetica;Impact=impact,chicago;Symbol=symbol;Tahoma=tahoma,arial,helvetica,sans-serif;Terminal=terminal,monaco;Times New Roman=times new roman,times;Trebuchet MS=trebuchet ms,geneva;Verdana=verdana,geneva;Webdings=webdings;Wingdings=wingdings,zapf dingbats',
        image_advtab: true,
        moxiemanager_remember_last_path: true
    });
}
function loadDatePicker() {
    $(".datepicker").datepicker({ "dateFormat": "dd/mm/yy" });
}
function loadDatePicker1() {
    $(".datepicker1").datepicker({
        "dateFormat": "dd/mm/yy", onSelect: function (datetext) {
            var d = new Date(); // for now
            var h = d.getHours();
            h = (h < 10) ? ("0" + h) : h;

            var m = d.getMinutes();
            m = (m < 10) ? ("0" + m) : m;

            var s = d.getSeconds();
            s = (s < 10) ? ("0" + s) : s;

            datetext = datetext + " " + h + ":" + m + ":" + s;
            $(this).val(datetext);
        }
    });
}

function pageLoad() {
    //$("#mainpage #maincontent #right .content").css("height", $(window).height() - 3 + "px");
    //$("#left,#mainpage #maincontent #right .content").mCustomScrollbar({
    //    autoHideScrollbar: true,
    //    theme: "minimal-dark"
    //});
    $(".txt1 select").select2();
    $(".txt2 select").select2();
    loadDatePicker(); loadDatePicker1();
    LoadTinyMCE();
    //$('.price-input-format').number(true);
    $('.price-input-format').number(true);
    // Jquery Dependency

    //$(".price-input-format']").on({
    //    keyup: function () {
    //        formatCurrency($(this));
    //    },
    //    blur: function () {
    //        formatCurrency($(this), "blur");
    //    }
    //});


    function formatNumber(n) {
        // format number 1000000 to 1,234,567
        return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",")
    }


    function formatCurrency(input, blur) {
        // appends $ to value, validates decimal side
        // and puts cursor back in right position.

        // get input value
        var input_val = input.val();

        // don't validate empty input
        if (input_val === "") { return; }

        // original length
        var original_len = input_val.length;

        // initial caret position 
        var caret_pos = input.prop("selectionStart");

        // check for decimal
        if (input_val.indexOf(".") >= 0) {

            // get position of first decimal
            // this prevents multiple decimals from
            // being entered
            var decimal_pos = input_val.indexOf(".");

            // split number by decimal point
            var left_side = input_val.substring(0, decimal_pos);
            var right_side = input_val.substring(decimal_pos);

            // add commas to left side of number
            left_side = formatNumber(left_side);

            // validate right side
            right_side = formatNumber(right_side);

            // On blur make sure 2 numbers after decimal
            if (blur === "blur") {
                right_side += "";
            }

            // Limit decimal to only 2 digits
            right_side = right_side.substring(0, 2);

            // join number by .
            input_val = "$" + left_side + "." + right_side;

        } else {
            // no decimal entered
            // add commas to number
            // remove all non-digits
            input_val = formatNumber(input_val);
            input_val = "$" + input_val;

            // final formatting
            if (blur === "blur") {
                input_val += "";
            }
        }

        // send updated string to input
        input.val(input_val);

        // put caret back in the right position
        var updated_len = input_val.length;
        caret_pos = updated_len - original_len + caret_pos;
        input[0].setSelectionRange(caret_pos, caret_pos);
    }

}
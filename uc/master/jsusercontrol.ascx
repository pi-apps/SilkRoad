<%@ Control Language="C#" AutoEventWireup="true" CodeFile="jsUserControl.ascx.cs" Inherits="UC_master_jsUserControl" %>
<script>var website = 'pisilkroad.com';</script>
<asp:HiddenField ID="hdfWorkingSession" ClientIDMode="Static" runat="server" />
<!-- Vendor JS Files -->
<script src="/Content/jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
<%--<script src="/pi-layout/assets/js/underscore-min.js"></script>--%>
<script src="/pi-layout/assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="/pi-layout/assets/vendor/aos/aos.js"></script>
<script src="/pi-layout/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/pi-layout/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="/pi-layout/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="/pi-layout/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="https://sdk.minepi.com/pi-sdk.js"></script>
<%--<script src="/pi-layout/assets/vendor/php-email-form/validate.js"></script>--%>

<%if (StringEntiter.isMobileBrowser())
    { %>
<script>
    function googleTranslateElementMobileInit() {
        new google.translate.TranslateElement({
            pageLanguage: 'vi',
            includedLanguages: '',
            autoDisplay: 'true',
            layout: google.translate.TranslateElement.InlineLayout.VERTICAL
        }, 'google_translate_element_mobile');
    }
</script>
<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementMobileInit"></script>
<%}
    else
    { %>
<script>
    function googleTranslateElementInit() {
        new google.translate.TranslateElement({
            pageLanguage: 'vi',
            includedLanguages: '',
            autoDisplay: 'true',
            layout: google.translate.TranslateElement.InlineLayout.VERTICAL
        }, 'google_translate_element');
    }
</script>
<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<%} %>
<!-- Template Main JS File -->
<script src="/pi-layout/colorbox/jquery.colorbox.js"></script>
<link href="/pi-layout/jpopup/css/jpopup.min.css" rel="stylesheet" />
<script src="/pi-layout/jpopup/js/jquery.jpopup.js"></script>
<script src="/pi-layout/assets/js/carteventright.js"></script>
<script src="/pi-layout/assets/js/pi-app.js"></script>
<script src="/pi-layout/assets/js/main.js"></script>
<script src="/pi-layout/assets/js/master.js"></script>
<script src="/pi-layout/assets/js/dathang.js"></script>
<script src="/pi-layout/assets/js/cart.js"></script>

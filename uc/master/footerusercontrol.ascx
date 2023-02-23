<%@ Control Language="C#" AutoEventWireup="true" CodeFile="footerUserControl.ascx.cs" Inherits="UC_master_footerUserControl" %>
<footer id="footer" class="footer">
    <div class="container">

        <div class="footer-body">
            <div class="row">
                <div class="col-md-6 col-lg-4 footer-col-form">
                    <div class="footer-section">
                        <h4 class="footer-section-head">ĐĂNG NHẬP EMAIL ĐỂ NHẬN THÔNG TIN
                        </h4>
                        <div class="footer-section-body">
                            <p>
                                Đăng nhập để nhận được những thông tin mới nhất về bộ sưu tập, chiến dịch và video qua email.
                                           
                            </p>
                            <p>
                            </p>
                            <div class="footer-form-group">
                                <input autocomplete="off" type="text" id="input-subscribe-email-footer" value="" class="footer-form-control" placeholder="*Email của bạn">
                                <button type="button" class="btn-subscribe-email-footer footer-form-btn">OK</button>
                            </div>
                            <p></p>
                        </div>
                    </div>
                    <div class="footer-section">
                        <h4 class="footer-section-head">TÌM KIẾM CỬA HÀNG
                        </h4>
                        <div class="footer-section-body">
                            <p>
                            </p>
                            <div class="footer-form-group form-select-1">
                                <i class="fa fa-map-marker footer-form-ico" aria-hidden="true"></i>
                                <select id="footerUserControl_ddlBranch" class="ddlBranchFooterJs footer-form-control">
                                    <option value="">&nbsp;Hệ thống cửa hàng của Pi Clover Ecommerce</option>
                                    <option value="3">&nbsp;Số 13 Đường 3/2, Phường 12, Quận 10, Thành phố Hồ Chí Minh</option>
                                </select>
                            </div>
                            <div id="show-info-store-ajax"></div>
                            <p></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-6 footer-col-menu" id="footer-accordion-section">
                    <div class="row">
                        <asp:Repeater ID="rptLinkMaster" OnItemDataBound="rptLinkMaster_ItemDataBound" runat="server">
                            <ItemTemplate>
                                <div class="col-sm-6 col-md-4">
                                    <div class="footer-section">
                                        <h4 class="footer-section-head"><%#Eval("GroupName") %>
                                            <asp:HiddenField ID="hdfId" Value='<%#Eval("Id") %>' runat="server" />
                                        </h4>
                                        <div class="footer-section-body">
                                            <ul>
                                                <asp:Repeater ID="rptLinkSub" runat="server">
                                                    <ItemTemplate>
                                                        <li><a href="<%#Eval("Link") %>" title="<%#Eval("Name") %>"><%#Eval("Name") %></a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div class="col-sm-6 col-md-4">
                            <div class="footer-section">
                                <h4 class="footer-section-head">KẾT NỐI VỚI CHÚNG TÔI
                                </h4>
                                <div class="footer-section-body">
                                    <ul class="footer-mxh">
                                        <asp:Repeater ID="rptMXH" runat="server">
                                            <ItemTemplate>
                                                <li>
                                                    <a href="<%#Eval("Link") %>" title="<%#Eval("Name") %>">
                                                        <div class="ico-social">
                                                            <img src="/<%#Eval("Icon") %>" alt="<%#Eval("Name") %>" title="<%#Eval("Name") %>" />
                                                        </div>
                                                        <%#Eval("Name") %></a>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </ul>
                                </div>
                            </div>
                        </div>



                        <%--
                        <div class="col-sm-6 col-md-8">
                            <div class="footer-section">
                                <h4 class="footer-section-head">CÔNG TY CỔ PHẦN PI CLOVER ECOMMERCE
                                                </h4>
                                <div class="footer-section-body" id="footerCollapseOnesoccial" aria-labelledby="headingOnesoccial" data-parent="#footer-accordion-section">
                    Văn phòng: Số 13 Đường 3/2, Phường 12, Quận 10, Thành phố Hồ Chí Minh, Việt Nam.
                                   
                    <br>
                    Mã số thuế 0323941896 do sở KHĐT TP Hồ Chí Minh cấp lần đầu ngày 18/05/2005
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
                <div class="col-md-6 col-lg-2 footer-col-contact">
                    <div class="row">
                        <div class="col-12 col-sm-4 col-md-12">
                            <div class="footer-section">
                                <h4 class="footer-section-head">
                                    <i class="fa fa-phone"></i>TỔNG ĐÀI
                                </h4>
                                <div class="footer-section-body">
                                    <p>
                                        <a href="tel:19008498" title="19008498">1900 8498</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-4 col-md-12">
                            <div class="footer-section">
                                <h4 class="footer-section-head">
                                    <i class="fa fa-phone"></i>CSKH
                                </h4>
                                <div class="footer-section-body">
                                    <p>
                                        <a href="tel:0280390455455" title="(84.28) 39 455 455">(84.28) 39 455 455</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-4 col-md-12">
                            <div class="footer-section">
                                <h4 class="footer-section-head">TRADING APP
                                </h4>
                                <div class="footer-section-body">
                                    <div class="store-wrap">
                                        <a class="store" href="#" target="_blank" rel="noreferrer noopener">
                                            <figure class="footer-link-figure">
                                                <img class="footer-link-img hover lozad fade-img" width="132" height="40" alt="App Store" src="/app-store-hover-en.svg?v=10" data-loaded="true">
                                            </figure>
                                        </a><a class="store" href="#" target="_blank" rel="noreferrer noopener">
                                            <figure class="footer-link-figure">
                                                <img class="footer-link-img hover lozad fade-img" width="132" height="40" alt="App Store" src="/google-play-hover-en.svg?v=10" data-loaded="true">
                                            </figure>
                                        </a>
                                    </div>

                                    <%--<p>
                                        <a href="#" title="pi">
                                            <img class="img-payment-footer" src="/pi-logo.png" title="pi">
                                        </a>
                                    </p>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-head" style="display: none;">
            <div class="row">
                <div class="col-12">
                    <div class="footer-logo">
                        <a href="/">
                            <img src="/logo-footer.png" title="pi">
                        </a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</footer>
<div class="clearfix"></div>
<div class="footer-foot">
    <div class="container">
        <div class="row1">
            <div class="footer-foot-left">
            <a href="/">
                <img src="/logo-footer.png" title="pi">
                <br />
                <span>Pisilkroad © PiOS - 2023</span>
            </a>
        </div>
        <div class="footer-foot-right">
            <div class="footer-copyright">
                <a href="/" title=""><span>CÔNG TY CỔ PHẦN PI CLOVER ECOMMERCE</span></a>
                <br>Văn phòng: Số 13 Đường 3/2, Phường 12, Quận 10, Thành phố Hồ Chí Minh, Việt Nam.        
                    <br>
                Mã số thuế 0323941896 do sở KHĐT TP Hồ Chí Minh cấp lần đầu ngày 18/05/2005
                               
            </div>
            <%--<ul class="footer-nav-list">

                    <li><a href="#" title="Điều khoản sử dụng">Điều khoản sử dụng</a></li>

                    <li><a href="#" title="Bảo vệ dữ liệu">Bảo vệ dữ liệu</a></li>

                    <li><a href="#" title="Chính sách bảo mật">Chính sách bảo mật</a></li>

                    <li><a href="#" title="Chính sách cookie">Chính sách cookie</a></li>

                </ul>--%>
        </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="clearfix"></div>

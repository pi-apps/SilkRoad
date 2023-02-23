<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PartnerUserControl.ascx.cs" Inherits="UC_home_PartnerUserControl" %>
<!-- ======= Clients Section ======= -->
<section id="clients" class="clients" style="display: normal;">
    <div class="home-1-title-cus">
        <div class="container">
            <h3>Đối tác & nhà tài trợ</h3>
        </div>
    </div>
    <div class="container" data-aos="fade-up">

        <%--<header class="section-header">--%>
            <h2><%--Đối tác & Truyền thông--%></h2>
            <%--<p>Đối tác & nhà tài trợ</p>
        </header>--%>

        <div class="clients-slider swiper">
            <div class="swiper-wrapper align-items-center">
                <asp:Repeater ID="rptPartner" runat="server">
                    <ItemTemplate>
                        <div class="swiper-slide">
                            <a href="<%#Eval("Link") %>" title="<%#Eval("Name") %>">
                                <img src="/<%#Eval("Logo") %>" class="img-fluid" alt="<%#Eval("Name") %>" title="<%#Eval("Name") %>">
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </div>

</section>
<!-- End Clients Section -->

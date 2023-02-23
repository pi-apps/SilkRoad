<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ServiceUserControl.ascx.cs" Inherits="UC_home_ServiceUserControl" %>
<!-- ======= Services Section ======= -->
<section id="services" class="services">

    <div class="container" data-aos="fade-up">

        <header class="section-header">
            <h2>Services</h2>
            <p>Kết nối doanh nghiệp – nhà cung cấp với người tiêu dùng theo tiêu chuẩn của hệ thống Pi Network</p>
        </header>

        <div class="row gy-4">
            <asp:Repeater ID="rptService" runat="server">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                        <div id="box-service-<%#Eval("Id") %>" class="service-box" style="border-bottom: 3px solid <%#Eval("ColorCode") %>;">
                            <img class="img-box-service" src="/<%#Eval("Image") %>" alt="<%#Eval("Name") %>" title="<%#Eval("Name") %>" />
                            <h3><%#Eval("Name") %></h3>
                            <p><%#Eval("Summary") %></p>
                            <a style="color: <%#Eval("ColorCode") %>;" title="<%#Eval("Name") %>" href="/dich-vu/<%#Eval("Name").ToString().RemoveSymbol() %>-<%#Eval("Id") %>.html" class="read-more"><span>Xem thêm</span> <i class="bi bi-arrow-right"></i></a>
                        </div>
                    </div>
                    <style>
                        #box-service-<%#Eval("Id") %>:hover {
                            background: <%#Eval("ColorCode") %>;
                        }
                        #box-service-<%#Eval("Id") %>:hover a{
                            color:#fff !important;
                        }
                    </style>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>

</section>
<!-- End Services Section -->

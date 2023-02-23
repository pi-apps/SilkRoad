<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AboutUserControl.ascx.cs" Inherits="UC_home_AboutUserControl" %>
<!-- ======= About Section ======= -->
<section id="about" class="about">
    <div class="container" data-aos="fade-up">
        <asp:Repeater ID="rptAbout" runat="server">
            <ItemTemplate>
                <div class="row gx-0">
                    <div class="col-lg-6 d-flex align-items-center" data-aos="zoom-out" data-aos-delay="200">
                        <video autoplay muted loop id="myVideo">
                            <source src="home.mp4" type="video/mp4">
                        </video>
                    </div>
                    <div class="col-lg-6 d-flex flex-column justify-content-center" data-aos="fade-up" data-aos-delay="200">
                        <div class="content">
                            <h3><%#Eval("Name") %></h3>
                            <h2><%#Eval("SummarySub") %></h2>
                            <p><%#Eval("Summary") %> </p>
                            <div class="text-center text-lg-start">
                                <a title="<%#Eval("Name") %>" href="/gioi-thieu/<%#Eval("Name").ToString().RemoveSymbol() %>-<%#Eval("Id") %>.html" class="btn-read-more d-inline-flex align-items-center justify-content-center align-self-center">
                                    <span>Xem thêm</span>
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>



                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</section>
<!-- End About Section -->

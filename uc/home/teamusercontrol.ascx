<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TeamUserControl.ascx.cs" Inherits="UC_home_TeamUserControl" %>
<!-- ======= Team Section ======= -->
<section id="team" class="team" style="display: normal;">

    <div class="container" data-aos="fade-up">

        <header class="section-header">
            <h2>Team</h2>
            <p>Our hard working team</p>
        </header>
        <div class="row gy-4">
            <asp:Repeater ID="rptOurTeam" runat="server">
                <ItemTemplate>
                    <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
                        <div class="member">
                            <div class="member-img">
                                <img src="/<%#Eval("Image") %>" class="img-fluid" alt="<%#Eval("Name") %>" title="<%#Eval("Name") %>">
                                <div class="social">
                                    <a href="<%#Eval("Facebook") %>"><i class="bi bi-facebook"></i></a>
                                    <a href="<%#Eval("Telegram") %>"><i class="bi bi-telegram"></i></a>
                                    <a href="<%#Eval("Linkedin") %>"><i class="bi bi-linkedin"></i></a>
                                    <a href="<%#Eval("Twitter") %>"><i class="bi bi-twitter"></i></a>
                                    <a href="<%#Eval("Youtube") %>"><i class="bi bi-youtube"></i></a>
                                </div>
                            </div>
                            <div class="member-info">
                                <h4><%#Eval("Name") %></h4>
                                <span><%#Eval("Postiton") %></span>
                                <p><%#Eval("Summary") %></p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</section>
<!-- End Team Section -->

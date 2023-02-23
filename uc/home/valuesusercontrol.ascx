<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ValuesUserControl.ascx.cs" Inherits="UC_home_ValuesUserControl" %>
<!-- ======= Values Section ======= -->
<section id="values" class="values">

    <div class="container" data-aos="fade-up">

        <header class="section-header">
            <h2>Our Values</h2>
            <p>Tầm nhìn /  Whitepaper / Roadmap</p>
        </header>

        <div class="row">
            <asp:Repeater ID="rptOurValue" runat="server">
                <ItemTemplate>
                    <div class="col-lg-4" data-aos="fade-up" data-aos-delay="600">
                        <div class="box">
                            <img src="/<%#Eval("Image") %>" class="img-fluid" alt="<%#Eval("Name") %>" title="<%#Eval("Name") %>">
                            <h3><%#Eval("Name") %></h3>
                            <p><%#Eval("Summary") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</section>
<!-- End Values Section -->

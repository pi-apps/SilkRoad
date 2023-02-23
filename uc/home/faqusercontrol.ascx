<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FaqUserControl.ascx.cs" Inherits="UC_home_FaqUserControl" %>
<!-- ======= F.A.Q Section ======= -->
<section id="faq" class="faq" style="display: normal;">

    <div class="container" data-aos="fade-up">

        <header class="section-header">
            <h2>F.A.Q</h2>
            <p>Frequently Asked Questions</p>
        </header>

        <div class="accordion accordion-flush row" id="faqlist2">
            <asp:Repeater ID="rptFaq" runat="server">
                <ItemTemplate>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-<%#Eval("Id") %>">
                                    <%#Eval("Question") %>
                                </button>
                            </h2>
                            <div id="faq-content-<%#Eval("Id") %>" class="accordion-collapse collapse" data-bs-parent="#faqlist<%#Eval("Id") %>">
                                <div class="accordion-body">
                                    <%#Eval("Answer") %>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</section>
<!-- End F.A.Q Section -->

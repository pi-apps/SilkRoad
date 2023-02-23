<%@ Control Language="C#" AutoEventWireup="true" CodeFile="slidebarLeftUserControl.ascx.cs" Inherits="danhmuc_left_slidebarLeftUserControl" %>
<div class="col-md-3">
    <div class="shop-filters">
        <div id="accordion">
            <div class="card">
                <div class="card-header" id="headingTwo">
                    <h5 class="mb-0">
                        Danh mục hàng
                    </h5>
                </div>
                <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordion">
                    <div class="card-body">
                        <div class="menu-danh-muc-san-pham-vertical-menu-container">
                            <ul id="menu-danh-muc-san-pham-vertical-menu11" class="menu-cate-left menu">
                                <asp:Repeater ID="rptCateProDM" runat="server" OnItemDataBound="rptCateProDM_ItemDataBound">
                                    <ItemTemplate>
                                        <li id="menu-item-<%#Eval("Id") %>" class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-has-children <%#Eval("Count").ToString()!="0"?"menu-item-has-children dropdown":"" %> menu-item-pro-<%#Eval("Id") %> menu-item-<%#Eval("Id") %>">
                                            <asp:HiddenField ID="hdfId" runat="server" Value='<%#Eval("Id") %>' />
                                            <a title="<%#Eval("Name")%>" href="<%#urlDomainShare %>/gian-hang/san-pham-gian-hang/<%#Eval("Name").ToString().RemoveSymbol()%>-<%#Eval("Id") %>-<%#Eval("shopRentalId") %>.html"><i class="fa fa-angle-right" aria-hidden="true"></i>&nbsp;<%#Eval("Name")%></a>
                                            <%#Eval("Count").ToString()!="0"?"<button type='button' class='icon-add-1 toggle'><i class='fa fa-angle-down' aria-hidden='true'></i></button>":"" %>
                                            <asp:Literal ID="ltrMenuSub" runat="server"></asp:Literal>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            

        </div>
    </div>
    <%--<div class="left-ad mt-4">
                        <img class="img-fluid" src="http://via.placeholder.com/254x557" alt="">
                    </div>--%>
</div>

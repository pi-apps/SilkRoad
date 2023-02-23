using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database;
public partial class exam_popup_luotthitrongngay : PrivateUser
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var lstAuction = dbConnect.pro_HistoryProductAuctions
            .Where(n => n.pro_ProductId == int.Parse(Request["Id"].Split(',')[0])).OrderByDescending(n => n.PriceAuction)
            .Select(n => new
            {
                n.Id,
                n.CreatedAt,
                n.PriceAuction,
                n.store_Customer.Code,
                n.store_CustomerId,
                n.IsWin
            }).ToList();
        var product = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"].Split(',')[0]));
        Repeater1.DataSource = lstAuction;
        Repeater1.DataBind();
        if (lstAuction.Count() > 0)
        {
            if (product.IsAuctionEnd != true)
            {
                btnXuLyDauGia.Visible = true;
            }
        }
        if (product.IsAuctionEnd == true || product.IsDeleted==true)
        {
            btnXuLyDauGia.Visible = false;
            ltrThongBao.Text = "<div class='alert alert-success' role='alert'>Phiên đấu giá đã kết thúc</div>";
        }
        else
        {

        }
    }
    protected void btnXuLyDauGia_Click(object sender, EventArgs e)
    {
        var product = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"].Split(',')[0]));
        TransactionBirdProductUtil transactionBirdProductUtil = new TransactionBirdProductUtil();
        transactionBirdProductUtil.CreateTransactionEndAuction(Request["Id"]);
        if (product.IsAuctionEnd == true || product.IsDeleted == true)
        {
            btnXuLyDauGia.Visible = false;
            ltrThongBao.Text = "<div class='alert alert-success' role='alert'>Phiên đấu giá đã kết thúc</div>";
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "refreshParent()", true);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}
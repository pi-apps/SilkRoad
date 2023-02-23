
using Database;
using DevExpress.Web;
using dxtLib.WebProvider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Siteadmin_cauhinh_banner_DanhSachBanner : PrivateUser
{
    protected void Page_Load(object sender, EventArgs e)
    {
        loaddata();
    }
    private void loaddata()
    {
        var models = dbConnect.order_Orders
            .Where(n => n.BuyerId == Account.Id)
            .OrderByDescending(n => n.CreatedAt)
            .Select(n => new
            {
                n.Id,n.store_ShopRentalId,
                n.pro_Product.ProductName,
                n.pro_Product.Image,
                pro_ProductId=n.pro_Product.Id,
                n.Code,
                n.ExchangeRate,
                n.PriceSell,
                n.TotalAmount,
                IsAuction = n.IsAuction == null ? false : n.IsAuction.Value,
                n.CreatedAt,
                n.IsBuyerConfirm,
                n.IsSellerConfirm,
                n.BuyerConfirmDate,
                n.SellerConfirmDate
            });
        ASPxGVDS.DataSource = models;
        ASPxGVDS.DataBind();
        ASPxGVDS.ExpandRow(0);
    }
    protected void ASPxGVDS_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
    {
        if (e.Column.FieldName == "STT")
        {
            e.Value = string.Format("{0}", e.ListSourceRowIndex + 1);
        }
    }
    protected void ASPxGVDS_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
    {
        string Id = e.GetValue("Id").ToString();
        var tranc = dbConnect.order_Orders.Single(n => n.Id == int.Parse(Id));
        if (e.DataColumn.FieldName == "IsSellerConfirm")
        {
            if (tranc.IsSellerConfirm == false || tranc.IsSellerConfirm == null)
            {
                e.Cell.Text = "<span class='naptien-choxacnhanuser'>Chưa xác nhận</span>";
            }
            else
            {
                e.Cell.Text = "<span class='naptien-daxacnhanuser'>Đã xác nhận</span>";
            }
        }
        if (e.DataColumn.FieldName == "TransactionStaus")
        {
            if (tranc.IsDeleted == true)
            {
                e.Cell.Text = "<span class='naptien-dahuy'>Đã hủy</span>";
            }
            else
            {
                if (tranc.IsBuyerConfirm == false || tranc.IsBuyerConfirm == null)
                {
                    e.Cell.Text = "<span class='naptien-choxacnhanuser'>Chờ xác nhận</span>";
                }
                else if (tranc.IsBuyerConfirm == true && (tranc.IsSellerConfirm == false || tranc.IsSellerConfirm == null))
                {
                    e.Cell.Text = "<span class='naptien-choxacnhanadmin'>Chờ xác nhận</span>";
                }
                else if (tranc.IsSellerConfirm == true)
                {
                    e.Cell.Text = "<span class='naptien-giaodichthanhcong'>Giao dịch thành công</span>";
                }
            }
        }
    }
    protected void btnDelete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton l = sender as ImageButton;
            order_Order model = dbConnect.order_Orders.Single(m => m.Id == int.Parse(l.CommandArgument));
            if ((model.IsBuyerConfirm == null || model.IsBuyerConfirm == false) && model.IsDeleted == false)
            {
                model.IsDeleted = true;
                model.UpdatedAt = DateTime.Now;
                model.UpdatedBy = Account.Email;
                dbConnect.SubmitChanges();
            }
            loaddata();
        }
        catch { }
    }

    protected void imgTT_Click(object sender, ImageClickEventArgs e)
    {
    }
}
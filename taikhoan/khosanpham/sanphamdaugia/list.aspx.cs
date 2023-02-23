
using Database;
using DevExpress.Web;
using dxtLib.WebProvider;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Siteadmin_cauhinh_banner_DanhSachBanner : PrivateUser
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //loaddata();
        if (!IsPostBack)
        {
            var cus = dbConnect.store_Customers.Single(n => n.Id == Account.Id);
            if (cus.PiWallet == null || cus.PiWallet == "" || cus.PiWallet.ToString().Trim().Length == 0)
            {
                btnAddNew.Visible = false;
            }
            else
            {
                btnAddNew.Visible = true;
            }
            ASPxGVDS.ExpandAll();
            ASPxGVDS.DataBind();
        }
    }
    protected void ASPxGVDS_DataBinding(object sender, EventArgs e)
    {
        loaddata();
    }
    private void loaddata()
    {
        var models = dbConnect.pro_Products
            .Where(n => n.IsDeleted == false || n.IsDeleted == null)
            .Where(n=>n.IsAuction==true && n.store_CustomerId==Account.Id)
            .OrderByDescending(n => n.Id)
                    .Select(n => new
                    {
                        n.Id,
                        n.ViewCount,n.PriceAuction,n.AuctionStart,n.AuctionEnd,
                        n.ProductName,
                        IsAuctionEnd=(n.IsAuctionEnd==null?false: n.IsAuctionEnd.Value),
                        n.Code,
                        n.Image,
                        n.NumOr,
                        n.IsStatus,n.IsAuction
                    });
        ASPxGVDS.DataSource = models;
        //ASPxGVDS.DataBind();
        ASPxGVDS.ExpandAll();
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
        var product = dbConnect.pro_Products.Single(n => n.Id == int.Parse(e.GetValue("Id") + ""));
        if(e.DataColumn.FieldName== "AuctionEnd")
        {
            MultiView MultiView1 = ASPxGVDS.FindRowCellTemplateControl
                                    (e.VisibleIndex, e.DataColumn, "MultiView1") as MultiView;
            if (product.AuctionStart <= DateTime.Now && product.AuctionEnd >= DateTime.Now&&product.IsAuctionPublic == true && product.IsStatus == true)
            {
                MultiView1.ActiveViewIndex = 0;
            }
            else
            {
                MultiView1.ActiveViewIndex = 1;
            }

        }
        if (e.DataColumn.FieldName == "TTT")
        {
            string strStatus = "";
            if (product.AuctionStart <= DateTime.Now && product.AuctionEnd >= DateTime.Now)
            {
                if (product.IsAuctionPublic == true && product.IsStatus == true)
                {
                    strStatus = "<span class='auction-dang-chay'>Đang chạy</span>";
                }
                else
                {
                    if (product.IsAuctionPublic == false)
                    {
                        strStatus = "<span class='auction-khong-du-tien'>Không đủ tiền</span>";
                    }
                    else
                    {
                        if (product.IsStatus == false)
                        {
                            strStatus = "<span class='auction-dang-tam-dung'>Đang tạm dừng</span>";
                        }
                        else
                        {
                            strStatus = "<span class='auction-dang-chay'>Đang chạy</span>";
                        }
                    }
                }
            }
            else
            {
                if (product.IsAuctionPublic == true && product.IsStatus == true)
                {
                    strStatus = "<span class='auction-da-ket-thuc'>Đã kết thúc</span>";
                }
                else strStatus = "<span class='auction-khong-hoat-dong'>Không hoạt động</span>";
            }
            e.Cell.Text = strStatus;
        }
    }
    protected void btnDelete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton l = sender as ImageButton;
            pro_Product model = dbConnect.pro_Products.Single(m => m.Id == int.Parse(l.CommandArgument));
            model.IsDeleted = true; model.IsStatus = false;
            model.DeletedBy = Account.Email;
            model.DeletedAt = DateTime.Now;
            try { dbConnect.pro_Products.DeleteOnSubmit(model); } catch { }
            dbConnect.SubmitChanges();
            loaddata();
        }
        catch { }
    }

    protected void imgTT_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_Product model = dbConnect.pro_Products.Single(m => m.Id == int.Parse(l.CommandArgument));
        model.IsStatus = !model.IsStatus;
        model.UpdatedBy = Account.Email;
        model.UpdatedAt = DateTime.Now;
        dbConnect.SubmitChanges();
        loaddata();
    }

    protected void imgPromotion_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_Product model = dbConnect.pro_Products.Single(m => m.Id == int.Parse(l.CommandArgument));
        model.IsPromotion = !model.IsPromotion;
        model.UpdatedBy = Account.Email;
        model.UpdatedAt = DateTime.Now;
        dbConnect.SubmitChanges();
        loaddata();
    }

    protected void imgGoldTime_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_Product model = dbConnect.pro_Products.Single(m => m.Id == int.Parse(l.CommandArgument));
        model.IsGoldTime = !model.IsGoldTime;
        model.UpdatedBy = Account.Email;
        model.UpdatedAt = DateTime.Now;
        dbConnect.SubmitChanges();
        loaddata();
    }

    protected void btnAddNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("new.aspx?add=new");
    }
}
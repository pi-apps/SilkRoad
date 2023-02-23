
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
            if (cus.PiWallet == null|| cus.PiWallet=="" || cus.PiWallet.ToString().Trim().Length == 0)
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
            .Where(n=>n.store_ShopRental.store_CustomerId==Account.Id)
            .Where(n => n.IsDeleted == false || n.IsDeleted == null).OrderByDescending(n => n.Id)
                    .Where(n => n.IsAuction == false)
            .Select(n => new
                    {
                        n.Id,
                        n.ViewCount,
                        ShopName=n.store_ShopRental.Name,
                        n.ProductName,
                        n.Code,
                        CountPrice = n.pro_ProductPrices.Where(m => m.IsDeleted == false || m.IsDeleted == null).Count()
                        ,n.Price,n.PriceSell,
                        n.Image,
                        n.NumOr,
                        n.IsStatus,
                        n.IsPromotionTime,
                        n.IsPromotion,
                        n.IsHome,
                        n.IsGoldTime,
                        CountDM = n.pro_ProductCategories.Count,
                        CountTag = n.pro_ProductTags.Count,
                        CountDanhGia = n.pro_ProductComments.Count,
                        CountLQ = n.pro_ProductRelateds.Count,
                        CountSame = n.pro_ProductSameTypes.Count
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
        if (e.DataColumn.FieldName == "IsStatus")
        {
            string visible = e.GetValue("IsStatus").ToString();
            if (visible == "False")
            {
                ImageButton imgtt = ASPxGVDS.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "imgTT") as ImageButton;
                imgtt.ImageUrl = "/taikhoan/images/hidden.gif";
            }
        }
        if (e.DataColumn.FieldName == "IsPromotion")
        {
            string visible = e.GetValue("IsPromotion").ToString();
            if (visible == "False")
            {
                ImageButton imgtt = ASPxGVDS.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "imgPromotion") as ImageButton;
                imgtt.ImageUrl = "/taikhoan/images/hidden.gif";
            }
        }
        if (e.DataColumn.FieldName == "IsGoldTime")
        {
            string visible = e.GetValue("IsGoldTime").ToString();
            if (visible == "False")
            {
                ImageButton imgtt = ASPxGVDS.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "imgGoldTime") as ImageButton;
                imgtt.ImageUrl = "/taikhoan/images/hidden.gif";
            }
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
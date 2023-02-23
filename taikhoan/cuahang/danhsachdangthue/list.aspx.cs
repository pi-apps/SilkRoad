
using Database;
using DevExpress.Web;
using dxtLib.WebProvider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Configuration;

public partial class Siteadmin_cauhinh_banner_DanhSachBanner : PrivateUser
{
    public string domain { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        domain = ConfigurationManager.AppSettings["domain"];
        loaddata();
        
    }
    private void loaddata()
    {
        var models = dbConnect.procCusDanhSachGianHangDangThue(Account.Id);
        ASPxGVDS.DataSource = models;
        ASPxGVDS.DataBind();
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
        if (e.DataColumn.FieldName == "ShopStatus")
        {
            string visible = e.GetValue("ShopStatus").ToString();
            if (visible == "False")
            {
                ImageButton imgtt = ASPxGVDS.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "imgTT") as ImageButton;
                imgtt.ImageUrl = "/taikhoan/images/hidden.gif";
            }
        }
    }
    protected void btnDelete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton l = sender as ImageButton;
            store_ShopRental model = dbConnect.store_ShopRentals.Single(m => m.Id == int.Parse(l.CommandArgument));
            dbConnect.store_ShopRentals.DeleteOnSubmit(model);
            dbConnect.SubmitChanges();
            loaddata();
        }
        catch { }
    }

    protected void imgTT_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        store_ShopRental model = dbConnect.store_ShopRentals.Single(m => m.Id == int.Parse(l.CommandArgument));
        model.IsStatus = !model.IsStatus;
        model.UpdatedBy = Account.Email;
        model.UpdatedAt = DateTime.Now;
        dbConnect.SubmitChanges();
        loaddata();
    }

    protected void gridHistory_BeforePerformDataSelect(object sender, EventArgs e)
    {
        string Id = (sender as ASPxGridView).GetMasterRowFieldValues("Id").ToString();
        loadHistory(Id, sender);
    }
    void loadHistory(string Id, object sender)
    {
        ASPxGridView gridHistory = (ASPxGridView)sender;
        var models = dbConnect.store_ShopRentalPayments
            .Where(n => n.store_ShopRentalId == int.Parse(Id))
            .Select(n => new
            {
                n.Amount,n.Id,
                n.OrderCode,
                n.ExchangeRate,
                n.Price,
                n.MonthAmount,
                n.DepositDateline,
                n.Notification,
                n.PaymentDate
            });
        gridHistory.DataSource = models;
        //gridHistory.DataBind();
    }
    protected void gridHistory_CustomUnboundColumnData(object sender, ASPxGridViewColumnDataEventArgs e)
    {
        if (e.Column.FieldName == "STT")
        {
            e.Value = string.Format("{0}", e.ListSourceRowIndex + 1);
        }
    }

    protected void gridHistory_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
    {
        var store_ShopRentalPayment = dbConnect.store_ShopRentalPayments.Single(n => n.Id == int.Parse(e.GetValue("Id")+""));
        if (e.DataColumn.FieldName == "LoaiTT")
        {
            if (store_ShopRentalPayment.IsDeposit==true && store_ShopRentalPayment.IsDeposit!=null)
            {
                e.Cell.Text = "Đặt cọc";       
            }
            else
            {
                e.Cell.Text = "Phí thuê";
            }
        }
        if (e.DataColumn.FieldName == "TTT")
        {
            if(store_ShopRentalPayment.IsPayment==true && store_ShopRentalPayment.IsPayment != null)
            {
                e.Cell.Text = "<span class='tttt-thanh-cong'>Đã thanh toán</span>";
            }
            else if(store_ShopRentalPayment.IsUserConfirm == true && store_ShopRentalPayment.IsUserConfirm != null)
            {
                e.Cell.Text = "<span class='tttt-da-xac-nhan'>Đã xác nhận</span>";
            }
            else
            {
                e.Cell.Text = "<span class='tttt-chua-thanh-toan'>Chưa thanh toán</span>";
            }
        }
    }
}
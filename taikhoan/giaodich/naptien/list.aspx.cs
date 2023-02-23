
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
        var models = dbConnect.store_CustomerTransactionHistories
            .Where(n => n.store_CustomerId == Account.Id)
            //.Where(n => n.store_TransactionTypeId == 3 || n.store_TransactionTypeId == 1 || n.store_TransactionTypeId == 11)
            .OrderByDescending(n => n.CreatedAt)
            .Select(n => new
            {
                n.Id,
                n.Code,
                TransactionTypeName = n.store_TransactionType.Name,
                n.Amount,
                n.CreatedAt,
                n.IsUserConfirm,
                n.IsAdminConfirm,
                n.AdminConfirmDate,
                n.UserConfirmDate
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
        var tranc = dbConnect.store_CustomerTransactionHistories.Single(n => n.Id == int.Parse(Id));
        if (e.DataColumn.FieldName == "IsUserConfirm")
        {
            if (tranc.IsUserConfirm == false || tranc.IsUserConfirm == null)
            {
                e.Cell.Text = "<span class='naptien-choxacnhanuser'>Chưa xác nhận</span>";
            }
            else
            {
                e.Cell.Text = "<span class='naptien-daxacnhanuser'>Đã xác nhận</span>";
            }
        }
        if (e.DataColumn.FieldName == "IsAdminConfirm")
        {
            if (tranc.IsAdminConfirm == false || tranc.IsAdminConfirm == null)
            {
                e.Cell.Text = "<span class='naptien-choxacnhanadmin'>Chưa xác nhận</span>";
            }
            else
            {
                e.Cell.Text = "<span class='naptien-daxacnhanadmin'>Đã xác nhận</span>";
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
                if (tranc.IsUserConfirm == false || tranc.IsUserConfirm == null)
                {
                    e.Cell.Text = "<span class='naptien-choxacnhanuser'>Chờ xác nhận</span>";
                }
                else if (tranc.IsUserConfirm == true && (tranc.IsAdminConfirm == false || tranc.IsAdminConfirm == null))
                {
                    e.Cell.Text = "<span class='naptien-choxacnhanadmin'>Chờ xác nhận</span>";
                }
                else if (tranc.IsAdminConfirm == true)
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
            store_CustomerTransactionHistory model = dbConnect.store_CustomerTransactionHistories.Single(m => m.Id == int.Parse(l.CommandArgument));
            if ((model.IsAdminConfirm == null || model.IsAdminConfirm == false) && model.IsDeleted == false)
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
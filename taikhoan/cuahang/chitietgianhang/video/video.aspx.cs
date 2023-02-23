using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database;
using DevExpress.Web;
using dxtLib.WebProvider;

public partial class prodraftadmin_congty_nhanvien_EmployeeInfo : PrivateUser
{
    public store_ShopRental store_ShopRental { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        store_ShopRental = dbConnect.store_ShopRentals.Single(n => n.Id == int.Parse(Request["Id"]));
        loadData();
        if (!IsPostBack)
        {
            txtNumOr.Text = (dbConnect.store_Videos.Where(n => n.store_ShopRentalId == store_ShopRental.Id).Count() + 1).ToString();
            Panel1.Visible = false; Panel2.Visible = true;
        }
    }
    void loadData()
    {
        ASPxGVDS.DataSource = dbConnect.store_Videos.Where(n => n.store_ShopRentalId == store_ShopRental.Id)
            .OrderByDescending(n => n.Id);
        ASPxGVDS.DataBind();
        ASPxGVDS.SettingsEditing.Mode = GridViewEditingMode.Batch;
        ASPxGVDS.SettingsEditing.BatchEditSettings.StartEditAction = GridViewBatchStartEditAction.Click;
        ASPxGVDS.SettingsBehavior.AllowFocusedRow = false;
        ASPxGVDS.SettingsContextMenu.RowMenuItemVisibility.EditRow = false;
    }
    protected void btnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        store_Video model = dbConnect.store_Videos.Single(m => m.Id == int.Parse(l.CommandArgument));
        dbConnect.store_Videos.DeleteOnSubmit(model);
        dbConnect.SubmitChanges();
        hdfId.Value = "";
        Panel1.Visible = false; Panel2.Visible = true;
        loadData();
    }
    protected void btnEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        store_Video model = dbConnect.store_Videos.Single(m => m.Id == int.Parse(l.CommandArgument));
        txtLinkYoutube.Text = model.Youtube;
        txtNumOr.Text = model.NumOr + "";
        rdoIsHome.Checked = model.IsHome.Value;
        rdoStatus.Checked = model.IsStatus.Value;
        hdfId.Value = model.Id + "";
        Panel2.Visible = false; Panel1.Visible = true;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        store_ShopRental = dbConnect.store_ShopRentals.Single(n => n.Id == int.Parse(Request["Id"]));
        if (hdfId.Value != "")//update hiện có
        {
            store_Video model = dbConnect.store_Videos.Single(m => m.Id == int.Parse(hdfId.Value));
            model.UpdatedAt = DateTime.Now;
            model.UpdatedBy = Account.Email;
            model.Youtube = txtLinkYoutube.Text;
            model.NumOr = int.Parse(txtNumOr.Text);
            model.IsStatus = rdoStatus.Checked;
            model.IsHome = rdoIsHome.Checked;
            dbConnect.SubmitChanges();
            loadData();
            txtLinkYoutube.Text = "";
            txtNumOr.Text = (dbConnect.store_Videos.Where(n => n.store_ShopRentalId == store_ShopRental.Id).Count() + 1).ToString();
            hdfId.Value = "";
            Panel1.Visible = false; Panel2.Visible = true;
        }
        else //tạo mới
        {
            store_Video pro_ProductPriceVideo = new store_Video()
            {
                NumOr = 1,
                CreatedBy = Account.Email,
                CreatedAt = DateTime.Now,
                Image = "",
                store_ShopRentalId = store_ShopRental.Id,
                IsStatus = rdoStatus.Checked,
                Youtube=txtLinkYoutube.Text,
                LinkYoutube=txtLinkYoutube.Text,
                ViewCount=0,
                IsHome=rdoIsHome.Checked
            };
            dbConnect.store_Videos.InsertOnSubmit(pro_ProductPriceVideo);
            dbConnect.SubmitChanges();
            loadData();
            txtLinkYoutube.Text = "";rdoStatus.Checked = false;rdoIsHome.Checked = false;
            txtNumOr.Text = (dbConnect.store_Videos.Where(n => n.store_ShopRentalId == store_ShopRental.Id).Count() + 1).ToString();
            hdfId.Value = "";
            Panel1.Visible = false; Panel2.Visible = true;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        hdfId.Value = "";
        Panel1.Visible = false; Panel2.Visible = true;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        hdfId.Value = "";
        Panel1.Visible = true; Panel2.Visible = false; Panel1.Visible = true;
    }

    protected void rptImages_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //var tinDang = db.tblTinDangs.Single(n => n.Id == int.Parse(Request["Id"]));
        //var btnEdit = e.Item.FindControl("btnEdit") as ImageButton;
        //var btnDelete = e.Item.FindControl("btnDelete") as ImageButton;
        //if (tinDang.IsDuyetTin==true)
        //{
        //    btnEdit.Visible = btnDelete.Visible = false;
        //}
    }
    protected void ASPxGVDS_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
    {
        if (e.Column.FieldName == "STT")
        {
            e.Value = string.Format("{0}", e.ListSourceRowIndex + 1);
        }
    }
    protected void ASPxGVDS_BatchUpdate(object sender, DevExpress.Web.Data.ASPxDataBatchUpdateEventArgs e)
    {
        foreach (var args in e.UpdateValues)
            UpdateItem(args.Keys, args.NewValues, args.OldValues);
        dbConnect.SubmitChanges();
        e.Handled = true;
    }
    protected void UpdateItem(OrderedDictionary keys, OrderedDictionary newValues, OrderedDictionary oldValues)
    {
        int Id = int.Parse(keys["Id"].ToString());
        var model = dbConnect.store_Videos.Single(n => n.Id == Id);
        model.UpdatedAt = DateTime.Now; model.UpdatedBy = Account.Email;
        try { model.Youtube = newValues["Youtube"].ToString().Trim(); } catch { }
        try { model.NumOr = int.Parse(newValues["NumOr"].ToString().Trim()); } catch { }
        try { model.IsStatus = bool.Parse(newValues["IsStatus"].ToString().Trim()); } catch { }
        try { model.IsHome = bool.Parse(newValues["IsHome"].ToString().Trim()); } catch { }
    }
}
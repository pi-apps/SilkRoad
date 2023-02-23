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

public partial class prodraftadmin_congty_nhanvien_EmployeeInfo : AdminPageUtils
{
    public pro_Product pro_ProductPrice { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        pro_ProductPrice = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"]));
        loadData();
        if (!IsPostBack)
        {
            txtNumOr.Text = (dbConnect.pro_ProductVideos.Where(n => n.pro_ProductId == pro_ProductPrice.Id).Count() + 1).ToString();
            Panel1.Visible = false; Panel2.Visible = true;
        }
    }
    void loadData()
    {
        ASPxGVDS.DataSource = dbConnect.pro_ProductVideos.Where(n => n.pro_ProductId == pro_ProductPrice.Id).OrderByDescending(n => n.Id);
        ASPxGVDS.DataBind();
        ASPxGVDS.SettingsEditing.Mode = GridViewEditingMode.Batch;
        ASPxGVDS.SettingsEditing.BatchEditSettings.StartEditAction = GridViewBatchStartEditAction.Click;
        ASPxGVDS.SettingsBehavior.AllowFocusedRow = false;
        ASPxGVDS.SettingsContextMenu.RowMenuItemVisibility.EditRow = false;
    }
    protected void btnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_ProductVideo model = dbConnect.pro_ProductVideos.Single(m => m.Id == int.Parse(l.CommandArgument));
        dbConnect.pro_ProductVideos.DeleteOnSubmit(model);
        dbConnect.SubmitChanges();
        hdfId.Value = "";
        Panel1.Visible = false; Panel2.Visible = true;
        loadData();
    }
    protected void btnEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_ProductVideo model = dbConnect.pro_ProductVideos.Single(m => m.Id == int.Parse(l.CommandArgument));
        txtLinkYoutube.Text = model.YoutubeLink;
        txtNumOr.Text = model.NumOr + "";
        hdfId.Value = model.Id + "";
        Panel2.Visible = false; Panel1.Visible = true;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (hdfId.Value != "")//update hiện có
        {
            pro_ProductVideo model = dbConnect.pro_ProductVideos.Single(m => m.Id == int.Parse(hdfId.Value));
            model.UpdatedAt = DateTime.Now;
            model.UpdatedBy = Account.Employee.Email;
            model.YoutubeLink = txtLinkYoutube.Text;
            model.NumOr = int.Parse(txtNumOr.Text);
            dbConnect.SubmitChanges();
            loadData();
            txtLinkYoutube.Text = "";
            txtNumOr.Text = (dbConnect.pro_ProductVideos.Where(n => n.pro_ProductId == pro_ProductPrice.Id).Count() + 1).ToString();
            hdfId.Value = "";
            Panel1.Visible = false; Panel2.Visible = true;
        }
        else //tạo mới
        {
            pro_ProductVideo pro_ProductPriceVideo = new pro_ProductVideo()
            {
                NumOr = 1,
                CreatedBy = Account.Employee.Email,
                CreatedAt = DateTime.Now,
                Image = "",
                pro_ProductId = int.Parse(Request["Id"]),
                IsStatus = true,
                YoutubeLink=txtLinkYoutube.Text
            };
            dbConnect.pro_ProductVideos.InsertOnSubmit(pro_ProductPriceVideo);
            dbConnect.SubmitChanges();
            loadData();
            txtLinkYoutube.Text = "";
            txtNumOr.Text = (dbConnect.pro_ProductVideos.Where(n => n.pro_ProductId == pro_ProductPrice.Id).Count() + 1).ToString();
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
        var model = dbConnect.pro_ProductVideos.Single(n => n.Id == Id);
        model.UpdatedAt = DateTime.Now; model.UpdatedBy = Account.Employee.Email;
        try { model.YoutubeLink = newValues["YoutubeLink"].ToString().Trim(); } catch { }
        try { model.NumOr = int.Parse(newValues["NumOr"].ToString().Trim()); } catch { }
        try { model.IsStatus = bool.Parse(newValues["IsStatus"].ToString().Trim()); } catch { }
    }
}
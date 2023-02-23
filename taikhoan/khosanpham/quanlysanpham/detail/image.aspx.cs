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
    public pro_Product pro_Product { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        pro_Product = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"]));
        //loadData();
        if (!IsPostBack)
        {
            //rptImages.DataSource = dbConnect.pro_ProductImages.Where(n => n.pro_ProductId == pro_Product.Id).OrderByDescending(n => n.Id);
            //rptImages.DataBind();
            txtName.Text = pro_Product.ProductName;
            FileUpload1.AllowMultiple = true;
            Panel1.Visible = false; Panel2.Visible = true;
            
        }
        loadData();


    }
    void loadData()
    {
        ASPxGVDS.DataSource = dbConnect.pro_ProductImages.Where(n => n.pro_ProductId == pro_Product.Id).OrderByDescending(n => n.Id);
        //ASPxGVDS.DataBind();
        ASPxGVDS.DataBind();
        ASPxGVDS.SettingsEditing.Mode = GridViewEditingMode.Batch;
        ASPxGVDS.SettingsEditing.BatchEditSettings.StartEditAction = GridViewBatchStartEditAction.Click;
        ASPxGVDS.SettingsBehavior.AllowFocusedRow = false;
        ASPxGVDS.SettingsContextMenu.RowMenuItemVisibility.EditRow = false;
    }
    protected void btnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_ProductImage model = dbConnect.pro_ProductImages.Single(m => m.Id == int.Parse(l.CommandArgument));
        txtName.Text = model.ProductName;
        File.Delete(Server.MapPath("~/" + model.Image));
        dbConnect.pro_ProductImages.DeleteOnSubmit(model);
        dbConnect.SubmitChanges();
        hdfId.Value = ""; FileUpload1.AllowMultiple = true;
        Panel1.Visible = false; Panel2.Visible = true;
        loadData();
    }

    protected void btnEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_ProductImage model = dbConnect.pro_ProductImages.Single(m => m.Id == int.Parse(l.CommandArgument));
        FileUpload1.AllowMultiple = false;
        txtName.Text = model.ProductName;
        Image1.ImageUrl = "~/" + model.Image;
        hdfId.Value = model.Id + "";
        Panel2.Visible = false; Panel1.Visible = true;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (hdfId.Value != "")//update hiện có
        {
            var pro_ProductPriceModel = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"]));
            var proImage = dbConnect.pro_ProductImages.Single(n => n.Id == int.Parse(hdfId.Value));
            string urlImageFolder = "upload/san-pham/thu-vien-hinh/" + DateTime.Now.Year + "/" + DateTime.Now.Month.ToString("00");
            System.IO.Directory.CreateDirectory(Server.MapPath("~/" + urlImageFolder));
            proImage.ProductName = txtName.Text;
            proImage.UpdatedAt = DateTime.Now;
            proImage.UpdatedBy = Account.Employee.Email;
            if (FileUpload1.HasFile == false)//kiểm tra xem có upload hình ảnh không?
            {
            }
            else
            {
                string doihinh = FileUpload1.FileName.Trim();
                doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                string hinh_web = txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                FileUpload1.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                string ImgSub = urlImageFolder + "/" + hinh_web;
                proImage.Image = ImgSub;
            }
            dbConnect.SubmitChanges();
            loadData();
            txtName.Text = pro_ProductPriceModel.ProductName;
            Image1.ImageUrl = "~/upload/no-logo.png";
            hdfId.Value = "";
            Panel1.Visible = false; Panel2.Visible = true;
        }
        else //tạo mới
        {
            if (FileUpload1.HasFile == false)//kiểm tra xem có upload hình ảnh không?
            {
                ClientAlerter.Show(this, "Vui lòng chọn hình cần tải lên.");
            }
            else
            {
                var pro_ProductPriceModel = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"]));
                string urlImageFolder = "upload/" + DateTime.Now.Year + "/" + DateTime.Now.Month.ToString("00");
                System.IO.Directory.CreateDirectory(Server.MapPath("~/" + urlImageFolder));
                HttpFileCollection uploadedFiles = Request.Files;
                for (int i = 0; i < uploadedFiles.Count; i++)
                {
                    HttpPostedFile userPostedFile = uploadedFiles[i];
                    try
                    {
                        string doihinh = userPostedFile.FileName.Trim();
                        doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                        string hinh_web = i+"-"+txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                        userPostedFile.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                        string ImgSub = urlImageFolder + "/" + hinh_web;
                        pro_ProductImage dangImage = new pro_ProductImage()
                        {
                            ProductName = txtName.Text,
                            NumOr = 1,
                            CreatedBy = Account.Employee.Email,
                            CreatedAt = DateTime.Now,
                            Image = ImgSub,
                            pro_ProductId = pro_ProductPriceModel.Id,
                            IsStatus = true
                        };
                        dbConnect.pro_ProductImages.InsertOnSubmit(dangImage);
                    }
                    catch { }
                }
                
                dbConnect.SubmitChanges();


                loadData();
                txtName.Text = pro_ProductPriceModel.ProductName;
                Image1.ImageUrl = "~/upload/no-logo.png";
                hdfId.Value = "";
                Panel1.Visible = false; Panel2.Visible = true;
            }
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        var pro_ProductPriceModel = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"]));
        txtName.Text = pro_ProductPriceModel.ProductName;
        Image1.ImageUrl = "~/upload/no-logo.png";
        hdfId.Value = ""; FileUpload1.AllowMultiple = true;
        Panel1.Visible = false; Panel2.Visible = true;
        loadData();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        var pro_ProductPriceModel = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"]));
        txtName.Text = pro_ProductPriceModel.ProductName;
        Image1.ImageUrl = "~/upload/no-logo.png";
        hdfId.Value = ""; FileUpload1.AllowMultiple = true;
        Panel1.Visible = true; Panel2.Visible = false; Panel1.Visible = true;
        //loadData();
    }
    protected void ASPxGVDS_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
    {
        if (e.Column.FieldName == "STT")
        {
            e.Value = string.Format("{0}", e.ListSourceRowIndex + 1);
        }
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
        var model = dbConnect.pro_ProductImages.Single(n => n.Id == Id);
        model.UpdatedAt = DateTime.Now; model.UpdatedBy = Account.Employee.Email;
        try { model.ProductName = newValues["ProductName"].ToString().Trim(); } catch { }
        try { model.NumOr = int.Parse(newValues["NumOr"].ToString().Trim()); } catch { }
        try { model.IsStatus = bool.Parse(newValues["IsStatus"].ToString().Trim()); } catch { }
    }
}
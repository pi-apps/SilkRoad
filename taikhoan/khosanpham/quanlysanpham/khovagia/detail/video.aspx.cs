using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database;
using DongAGroup.Helpers.Encrypt;
using dxtLib.WebProvider;

public partial class prodraftadmin_congty_nhanvien_EmployeeInfo : AdminPageUtils
{
    public pro_ProductPrice pro_ProductPrice { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        pro_ProductPrice = dbConnect.pro_ProductPrices.Single(n => n.Id == int.Parse(Request["Id"]));
        if (!IsPostBack)
        {
            rptImages.DataSource = dbConnect.pro_ProductPriceVideos.Where(n => n.pro_ProductPriceId == pro_ProductPrice.Id).OrderByDescending(n => n.Id);
            rptImages.DataBind();
            txtNumOr.Text = (rptImages.Items.Count + 1).ToString();
            Panel1.Visible = false; Panel2.Visible = true;
        }
    }

    protected void btnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_ProductPriceVideo model = dbConnect.pro_ProductPriceVideos.Single(m => m.Id == int.Parse(l.CommandArgument));
        dbConnect.pro_ProductPriceVideos.DeleteOnSubmit(model);
        dbConnect.SubmitChanges();
        hdfId.Value = "";
        Panel1.Visible = false; Panel2.Visible = true;

    }
    protected void btnEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_ProductPriceVideo model = dbConnect.pro_ProductPriceVideos.Single(m => m.Id == int.Parse(l.CommandArgument));
        txtLinkYoutube.Text = model.YoutubeLink;
        txtNumOr.Text = model.NumOr + "";
        hdfId.Value = model.Id + "";
        Panel2.Visible = false; Panel1.Visible = true;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (hdfId.Value != "")//update hiện có
        {
            pro_ProductPriceVideo model = dbConnect.pro_ProductPriceVideos.Single(m => m.Id == int.Parse(hdfId.Value));
            model.UpdatedAt = DateTime.Now;
            model.UpdatedBy = Account.Employee.Email;
            model.YoutubeLink = txtLinkYoutube.Text;
            model.NumOr = int.Parse(txtNumOr.Text);
            dbConnect.SubmitChanges();
            rptImages.DataSource = dbConnect.pro_ProductPriceVideos.Where(n => n.pro_ProductPriceId == pro_ProductPrice.Id).OrderByDescending(n => n.Id);
            rptImages.DataBind();
            txtLinkYoutube.Text = "";
            txtNumOr.Text = (rptImages.Items.Count + 1).ToString();
            hdfId.Value = "";
            Panel1.Visible = false; Panel2.Visible = true;
        }
        else //tạo mới
        {
            pro_ProductPriceVideo pro_ProductPriceVideo = new pro_ProductPriceVideo()
            {
                NumOr = 1,
                CreatedBy = Account.Employee.Email,
                CreatedAt = DateTime.Now,
                Image = "",
                pro_ProductPriceId = int.Parse(Request["Id"]),
                IsStatus = true,
                YoutubeLink=txtLinkYoutube.Text
            };
            dbConnect.pro_ProductPriceVideos.InsertOnSubmit(pro_ProductPriceVideo);
            dbConnect.SubmitChanges();
            rptImages.DataSource = dbConnect.pro_ProductPriceVideos.Where(n => n.pro_ProductPriceId == pro_ProductPrice.Id).OrderByDescending(n => n.Id);
            rptImages.DataBind();
            txtLinkYoutube.Text = "";
            txtNumOr.Text = (rptImages.Items.Count + 1).ToString();
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
}
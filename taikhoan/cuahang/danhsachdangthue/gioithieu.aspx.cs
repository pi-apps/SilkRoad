using Database;
using dxtLib.WebProvider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Siteadmin_cauhinh_banner_new : PrivateUser
{
    protected void Page_PreRender(object sender, EventArgs e)
    {
        var Id = Request["Id"];
        if (!IsPostBack)
        {
            if (Id != null)
            {
                var model = dbConnect.store_ShopRentals.Single(n => n.Id == int.Parse(Id));
                txtId.Value = model.Id + "";
                txtName.Text = model.Name;
                txtCode.Text = model.Code;
                //show banner
                if (model.store_ShopAboutUs.Count > 0)
                {
                    var about = model.store_ShopAboutUs.First();
                    txtSeoDescription.Text = about.SeoDescription;
                    txtSeoKeyword.Text = about.SeoKeyword;
                    txtSeoTitle.Text = about.SeoTitle;
                    txtSocialDescription.Text = about.SocialDescription;
                    imgSocialImage.ImageUrl = "/" + about.SocialImage;
                    txtSocialTitle.Text = about.SocialTitle;
                    txtSummary.Value = about.Summary;
                    imgImage.ImageUrl = "/" + about.Image;
                    txtTitle.Text = about.Name;
                }
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string urlImageFolder = "user_upload/shop/" + DateTime.Now.Year + "/" + DateTime.Now.Month.ToString("00");
        System.IO.Directory.CreateDirectory(Server.MapPath("~/" + urlImageFolder));
        bool flag = false;
        string message = "";
        try
        {
            var model = dbConnect.store_ShopRentals.Single(n => n.Id == int.Parse(txtId.Value));
           
            if (model.store_ShopAboutUs.Count > 0)
            {
                var about = dbConnect.store_ShopAboutUs.Single(n => n.store_ShopRentalId == model.Id);
                about.UpdatedAt = DateTime.Now;
                about.UpdatedBy = Account.Employee.Email;
                about.SeoDescription = txtSeoDescription.Text;
                about.SeoKeyword = txtSeoKeyword.Text;
                about.SeoTitle = txtSeoTitle.Text;
                about.SocialDescription = txtSeoDescription.Text;
                about.SocialTitle = txtSocialTitle.Text;
                about.Summary = txtSummary.Value;
                about.Name = txtTitle.Text;
                try { about.store_ShopRentalId = model.Id; } catch { }
                if (fulImage.HasFile)
                {
                    string doihinh = fulImage.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "normal-" + txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    about.Image = ImgSub;
                    about.Banner = ImgSub;
                }
                if (fulSocialImage.HasFile)
                {
                    string doihinh = fulSocialImage.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "social-" + txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulSocialImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    about.SocialImage = ImgSub;
                }
                model.UpdatedAt = DateTime.Now;
                model.UpdatedBy = Account.Employee.Email;
            }
            else
            {
                var about = new store_ShopAboutUs() {
                    CreatedBy = Account.Employee.Email,
                    CreatedAt = DateTime.Now,
                    IsStatus=true,Name=txtTitle.Text,
                    IsDeleted=false,
                    NumOr=1,store_ShopRentalId=model.Id
                };
                about.UpdatedAt = DateTime.Now;
                about.UpdatedBy = Account.Employee.Email;
                about.SeoDescription = txtSeoDescription.Text;
                about.SeoKeyword = txtSeoKeyword.Text;
                about.SeoTitle = txtSeoTitle.Text;
                about.SocialDescription = txtSeoDescription.Text;
                about.SocialTitle = txtSocialTitle.Text;
                about.Summary = txtSummary.Value;
                about.Name = txtTitle.Text;
                if (fulImage.HasFile)
                {
                    string doihinh = fulImage.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "normal-" + txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    about.Image = ImgSub;
                    about.Banner = ImgSub;
                }
                if (fulSocialImage.HasFile)
                {
                    string doihinh = fulSocialImage.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "social-" + txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulSocialImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    about.SocialImage = ImgSub;
                }
                dbConnect.store_ShopAboutUs.InsertOnSubmit(about);
            }
            message = "Cập nhật thành công.";
            dbConnect.SubmitChanges();
            flag = true;
        }
        catch { flag = false; }
        if (flag)
        {
            ClientAlerter.ShowAndGoto(message, "list.aspx");
        }
        else
        {
            ClientAlerter.Show(this, "Lưu dữ liệu thất bại. Vui lòng kiểm tra lại");
        }
    }
}
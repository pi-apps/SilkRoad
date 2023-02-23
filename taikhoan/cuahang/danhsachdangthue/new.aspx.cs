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
            ddlShopStatus.DataSource = dbConnect.store_ShopStatus;
            ddlShopStatus.DataValueField = "Id";
            ddlShopStatus.DataTextField = "Name";
            ddlShopStatus.DataBind();
            ddlShopStatus.Items.Insert(0, new ListItem("--Chọn trạng thái--", ""));
            if (Id != null)
            {
                var model = dbConnect.store_ShopRentals.Single(n => n.Id == int.Parse(Id));
                txtId.Value = model.Id + "";
                txtName.Text = model.Name;
                txtSummary.Value = model.Summary;
                imgImage.ImageUrl = "/" + model.Banner;
                txtCode.Text = model.Code;
                txtExchangeRate.Text = model.ExchangeRate.ToString();
                txtSeoDescription.Text = model.SeoDescription;
                txtSeoKeyword.Text = model.SeoKeyword;
                txtSeoTitle.Text = model.SeoTitle;
                txtSocialDescription.Text = model.SocialDescription;
                imgSocialImage.ImageUrl = "/" + model.SocialImage;
                txtSocialTitle.Text = model.SocialTitle;
                try {ddlShopStatus.SelectedValue = model.store_ShopStatusId + "";} catch { }
                //show banner
                if (model.store_ShopBanners.Count > 0)
                {
                    var banner = model.store_ShopBanners.First();
                    imgBanner.ImageUrl = "/" + banner.Image;
                    txtLinkBanner.Text = banner.Link;
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
            model.UpdatedAt = DateTime.Now;
            model.UpdatedBy = Account.Email;
            model.Name = txtName.Text;
            try { model.ExchangeRate = double.Parse(txtExchangeRate.Text); } catch { }
            model.SeoDescription = txtSeoDescription.Text;
            model.SeoKeyword = txtSeoKeyword.Text;
            model.SeoTitle = txtSeoTitle.Text;
            model.SocialDescription = txtSeoDescription.Text;
            model.SocialTitle = txtSocialTitle.Text;
            model.Summary = txtSummary.Value;
            model.Code = txtCode.Text;
            try { model.store_ShopStatusId = int.Parse(ddlShopStatus.SelectedValue); } catch {  }
            if (fulImage.HasFile)
            {
                string doihinh = fulImage.FileName.Trim();
                doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                string hinh_web = "normal-" + txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                fulImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                string ImgSub = urlImageFolder + "/" + hinh_web;
                model.Banner = ImgSub;
            }
            if (fulSocialImage.HasFile)
            {
                string doihinh = fulSocialImage.FileName.Trim();
                doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                string hinh_web = "social-" + txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                fulSocialImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                string ImgSub = urlImageFolder + "/" + hinh_web;
                model.SocialImage = ImgSub;
            }
            if (model.store_ShopBanners.Count > 0)
            {
                var banner = dbConnect.store_ShopBanners.Single(n => n.store_ShopRentalId == model.Id);
                banner.Name = txtName.Text;
                banner.Link = txtLinkBanner.Text;
                if (fulBanner.HasFile)
                {
                    string doihinh = fulBanner.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "banner-" + txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulBanner.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    banner.Image = ImgSub;
                }
                model.UpdatedAt = DateTime.Now;
                model.UpdatedBy = Account.Email;
            }
            else
            {
                var banner = new store_ShopBanner() {
                    CreatedBy = Account.Email,
                    CreatedAt = DateTime.Now,
                    IsStatus=true,Name=txtName.Text,
                    Link=txtLinkBanner.Text,
                    IsDeleted=false,
                    NumOr=1,store_ShopRentalId=model.Id
                };
                if (fulBanner.HasFile)
                {
                    string doihinh = fulBanner.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "banner-" + txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulBanner.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    banner.Image = ImgSub;
                }
                dbConnect.store_ShopBanners.InsertOnSubmit(banner);
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
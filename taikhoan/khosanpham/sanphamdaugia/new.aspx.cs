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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ProductCategorysUtils.loadDropDownListEdit(ddlDanhMuc);
            if (Request["Id"] != null)
            {
                var model = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"]));
                if (model.IsAuctionEnd==true)
                {
                    btnSave.Visible = false;
                }
                else
                {
                    btnSave.Visible = true;
                }
                ddlDanhMuc.SelectedValue = model.pro_CategoryId + "";
                txtCode.Text = model.Code;
                txtName.Text = model.ProductName;
                imgImage.ImageUrl = "/" + model.Image;
                rdoStatus.Checked = model.IsStatus.Value;
                txtSummary.Value = model.Summary;
                txtDescription.Value = model.Description;
                txtSeoDescription.Text = model.SeoDescription;
                txtSeoKeyword.Text = model.SeoKeyword;
                txtSeoTitle.Text = model.SeoTitle;
                txtCachBaiTri.Value = model.CachBaiTri;
                txtSocialDescription.Text = model.SocialDescription;
                imgSocialImage.ImageUrl = "/" + model.SocialImage;
                txtSocialTitle.Text = model.SocialTitle;
                
                if (model.AuctionEnd <= DateTime.Now)
                {
                    btnSave.Visible = false;
                }
            }
            else
            {
                btnSave.Visible = true;
                rdoStatus.Checked = true;
                txtCode.Text = ProductCode();
            }
        }
    }
    public string ProductCode()
    {
        try
        {
            var cusCount = dbConnect.pro_Products.ToList().Last().Id + 1;//Select IDENT_CURRENT('[pimarketdb].[dbo].[store_Customer]')+1
            return string.Format("{0:PU00000000}", cusCount);
        }
        catch
        {
            return string.Format("{0:PU00000000}", 1);
        }
    }
    public string TransactionCode()
    {
        try
        {
            var cusCount = dbConnect.store_CustomerTransactionHistories.ToList().Last().Id + 1;
            return string.Format("{0:PT00000000}", cusCount);
        }
        catch
        {
            return string.Format("{0:PT00000000}", 1);
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string urlImageFolder = "user_upload/san-pham/" + DateTime.Now.Year + "/" + DateTime.Now.Month.ToString("00");
        System.IO.Directory.CreateDirectory(Server.MapPath("~/" + urlImageFolder));
        bool flag = false;
        string message = "";
        try
        {
            if (Request["Id"] != null)
            {
                #region Update
                var model = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"]));
                model.Code = txtCode.Text.Trim();
                //model.store_ShopRentalId=int.Parse(ddlCuahang.SelectedValue);
                model.pro_CategoryId= int.Parse(ddlDanhMuc.SelectedValue);
                model.store_CustomerId = Account.Id;
                model.ProductName = txtName.Text;
                model.IsStatus = rdoStatus.Checked;
                //model.NumOr = int.Parse(txtNumOr.Text);
                model.UpdatedAt = DateTime.Now;
                model.UpdatedBy = Account.Email;
                model.Description = txtDescription.Value;
                model.CachBaiTri = txtCachBaiTri.Value;
                model.IsAuction = true;
                if (fulSocialImage.HasFile)
                {
                    string doihinh = fulSocialImage.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "social-" + txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulSocialImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    model.SocialImage = ImgSub;
                }
                model.SeoDescription = txtSeoDescription.Text;
                model.SeoKeyword = txtSeoKeyword.Text;
                model.SeoTitle = txtSeoTitle.Text;
                model.SocialDescription = txtSeoDescription.Text;
                model.SocialTitle = txtSocialTitle.Text;
                model.Summary = txtSummary.Value;
                if (fulImage.HasFile)
                {
                    string doihinh = fulImage.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "normal-"+txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    model.Image = ImgSub;
                }
                model.LinkBanner = "";
                message = "Cập nhật thành công.";
                #endregion
            }
            else
            {
                #region Create
                var model = new pro_Product()
                {
                    CreatedAt = DateTime.Now,
                    IsAuction =true,
                    CachBaiTri=txtCachBaiTri.Value,
                    Code = ProductCode(),
                    CreatedBy = Account.Email,
                    IsAuctionEnd=false,
                    IsAuctionPublic=false,
                    ProductName = txtName.Text,
                    IsStatus = rdoStatus.Checked,
                    NumOr = dbConnect.pro_Products.ToList().Last().Id + 1,
                    ViewCount = 0,
                    store_CustomerId=Account.Id,
                    pro_CategoryId=int.Parse(ddlDanhMuc.SelectedValue),
                    //store_ShopRentalId=int.Parse(ddlCuahang.SelectedValue),
                    Description = txtDescription.Value,
                    SeoDescription = txtSeoDescription.Text,
                    SeoKeyword = txtSeoKeyword.Text,
                    SeoTitle = txtSeoTitle.Text,
                    SocialDescription = txtSeoDescription.Text,
                    SocialTitle = txtSocialTitle.Text,
                    Summary = txtSummary.Value,
                    IsDeleted = false,
                    IsBanner = false,
                    Banner = "",
                    pro_UnitId = 1,
                    LinkBanner = "",
                    pro_StatusProductId = 1,
                    pro_SupplierId = 3,
                    Price = 0,
                    PricePercent = 0,
                    PricePromotion = 0,
                    PriceSell = 0,
                };
                
                if (fulSocialImage.HasFile)
                {
                    string doihinh = fulSocialImage.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "social-" + txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulSocialImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    model.SocialImage = ImgSub;
                }
                if (fulImage.HasFile)
                {
                    string doihinh = fulImage.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "normal-"+txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    model.Image = ImgSub;
                }
                dbConnect.pro_Products.InsertOnSubmit(model);
                message = "Thêm mới thành công.";
                #endregion
            }
            dbConnect.SubmitChanges();
            flag = true;
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
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
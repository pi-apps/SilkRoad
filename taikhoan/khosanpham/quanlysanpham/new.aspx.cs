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

            ddlCuahang.DataSource = dbConnect.getListShopRentalCus(Account.Id).ToList();
            ddlCuahang.DataTextField = "Name";
            ddlCuahang.DataValueField = "Id";
            ddlCuahang.DataBind();
            ddlCuahang.Items.Insert(0, new ListItem("--Chọn cửa hàng--", ""));

            ddlSupplier.DataSource = dbConnect.pro_Suppliers.Where(n => n.IsStatus == true).OrderBy(n => n.NumOr);
            ddlSupplier.DataTextField = "Name";
            ddlSupplier.DataValueField = "Id";
            ddlSupplier.DataBind();
            ddlSupplier.Items.Insert(0, new ListItem("--Chọn nhà cung cấp--", ""));

            ddlDonViTinh.DataSource = dbConnect.pro_Units.Where(n => n.IsStatus == true).OrderBy(n => n.NumOr);
            ddlDonViTinh.DataTextField = "Name";
            ddlDonViTinh.DataValueField = "Id";
            ddlDonViTinh.DataBind();
            ddlDonViTinh.Items.Insert(0, new ListItem("--Chọn đơn vị tính--", ""));

            ddlStatusProduct.DataSource = dbConnect.pro_StatusProducts.Where(n => n.IsStatus == true).OrderBy(n => n.NumOr);
            ddlStatusProduct.DataTextField = "Name";
            ddlStatusProduct.DataValueField = "Id";
            ddlStatusProduct.DataBind();
            ddlStatusProduct.Items.Insert(0, new ListItem("--Chọn tình trạng sản phẩm--", ""));

            
            if (Request["Id"] != null)
            {
                var model = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"]));
                ddlSupplier.SelectedValue = model.pro_SupplierId + "";
                ddlStatusProduct.SelectedValue = model.pro_StatusProductId + "";
                ddlCuahang.SelectedValue = model.store_ShopRentalId + "";
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
                txtNumOr.Text = model.NumOr + "";
                txtPrice.Text = model.Price + "";
                txtPricePercent.Text = model.PricePercent + "";
                txtPricePromotion.Text = model.PricePromotion + "";
                txtPriceSell.Text = model.PriceSell + "";
                try { ddlDonViTinh.SelectedValue = model.pro_UnitId + ""; } catch { }
                
            }
            else
            {
                ddlSupplier.SelectedValue = "3";
                ddlStatusProduct.SelectedValue = "1";
                ddlDonViTinh.SelectedValue = "1";
                rdoStatus.Checked = true;
                txtNumOr.Text = (dbConnect.pro_Products.Count() + 1) + "";
                txtCode.Text = string.Format("{0:PD000000}", dbConnect.pro_Products.Count() + 1);
            }
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
                model.pro_CategoryId = int.Parse(ddlDanhMuc.SelectedValue);
                model.store_ShopRentalId = int.Parse(ddlCuahang.SelectedValue);
                model.ProductName = txtName.Text;
                model.IsStatus = rdoStatus.Checked;
                model.NumOr = int.Parse(txtNumOr.Text);
                model.UpdatedAt = DateTime.Now;
                model.UpdatedBy = Account.Email;
                model.Description = txtDescription.Value;
                model.CachBaiTri = txtCachBaiTri.Value;
                model.Price = double.Parse(txtPrice.Text.Replace(",", ""));
                model.PricePercent=double.Parse(txtPricePercent.Text.Replace(",", ""));
                model.PricePromotion=double.Parse(txtPricePromotion.Text.Replace(",", ""));
                model.PriceSell=double.Parse(txtPriceSell.Text.Replace(",", ""));
                model.IsAuction = false;
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
                model.pro_StatusProductId = int.Parse(ddlStatusProduct.SelectedValue);
                model.pro_SupplierId = int.Parse(ddlSupplier.SelectedValue);
                model.pro_UnitId = int.Parse(ddlDonViTinh.SelectedValue);
                message = "Cập nhật thành công.";
                #endregion
            }
            else
            {
                #region Create
                var model = new pro_Product()
                {
                    CreatedAt = DateTime.Now,IsAuction=false,
                    CachBaiTri=txtCachBaiTri.Value,
                    Code = txtCode.Text.Trim(),
                    CreatedBy = Account.Email,
                    ProductName = txtName.Text,
                    IsStatus = rdoStatus.Checked,
                    pro_CategoryId = int.Parse(ddlDanhMuc.SelectedValue),
                    store_ShopRentalId = int.Parse(ddlCuahang.SelectedValue),
                    NumOr = int.Parse(txtNumOr.Text),
                    ViewCount = 0,
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
                    pro_UnitId = int.Parse(ddlDonViTinh.SelectedValue),
                    LinkBanner = "",
                    pro_StatusProductId = int.Parse(ddlStatusProduct.SelectedValue),
                    pro_SupplierId = int.Parse(ddlSupplier.SelectedValue),
                    Price = double.Parse(txtPrice.Text.Replace(",", "")),
                    PricePercent = double.Parse(txtPricePercent.Text.Replace(",", "")),
                    PricePromotion = double.Parse(txtPricePromotion.Text.Replace(",", "")),
                    PriceSell = double.Parse(txtPriceSell.Text.Replace(",", ""))
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
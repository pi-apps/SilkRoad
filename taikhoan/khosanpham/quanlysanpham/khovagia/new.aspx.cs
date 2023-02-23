using Database;
using dxtLib.WebProvider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Siteadmin_cauhinh_banner_new : AdminPageUtils
{
    public pro_Product pro_Product { get; set; }
    //protected void Page_Load(object sender, EventArgs e)
    //{

    //    ASPxGridTags.DataSource = dbConnect.pro_AttributeDetails.Where(n => n.IsStatus == true).OrderBy(n => n.pro_Attribute.NumOr)
    //            .Select(n => new
    //            {
    //                n.Id,
    //                n.Name,
    //                n.Code,
    //                ParentName = n.pro_Attribute.Name
    //            });
    //    ASPxGridTags.DataBind();
    //    ASPxGridTags.GridView.ExpandRow(0);
    //}
    protected void Page_PreRender(object sender, EventArgs e)
    {
        var Id = Request["Id"];
        pro_Product = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["parent"]));
        //hdfCodeParent.Value = pro_Product.Code;
        var code = "P" + (pro_Product.pro_ProductPrices.Count + 1) + "";
        var codes = pro_Product.pro_ProductCategories.Where(n => n.IsCode == true);

        if (codes.Count() > 0)
        {
            code = codes.First().pro_Category.Code;
        }
        code = pro_Product.Code;
        
        if (!IsPostBack)
        {
            hdfCodeParent.Value = code;
            //load chi nhánh
            //rptShowRoom.DataSource = dbConnect.company_CompanyInfos.Where(n => n.BrandType == "Showroom" && n.Active == true).OrderBy(n => n.SortOrder);
            rptShowRoom.DataSource = dbConnect.company_CompanyInfos.Where(n => n.Active == true).OrderBy(n => n.SortOrder);
            rptShowRoom.DataBind();
            rptAttribute.DataSource = dbConnect.pro_Attributes.Where(n => n.IsStatus == true).OrderBy(n => n.NumOr);
            rptAttribute.DataBind();

            if (Id != null)
            {
                var model = dbConnect.pro_ProductPrices.Single(n => n.Id == int.Parse(Request["Id"]));
                txtAccountantCode.Text = model.AccountantCode;
                txtCode.Text = model.Code;
                txtImportCode.Text = model.ImportCode;
                txtName.Text = model.ProductName;
                //txtImage.Value = model.Image;
                imgImage.ImageUrl = "/" + model.Image;
                imgImageLarge.ImageUrl = "/" + model.ImageLarge;
                imgSocialImage.ImageUrl = "/" + model.SocialImage;
                txtSeoDescription.Text = model.SeoDescription;
                txtSeoKeyword.Text = model.SeoKeyword;
                txtSeoTitle.Text = model.SeoTitle;
                txtSocialDescription.Text = model.SocialDescription;
                imgSocialImage.ImageUrl = "/" + model.SocialImage;
                txtSocialTitle.Text = model.SocialTitle;
                txtNumOr.Text = model.NumOr + "";
                //txtImageLarge.Value = model.ImageLarge;
                rdoIsMain.Checked = model.IsMain.Value;
                rdoStatus.Checked = model.IsStatus.Value;
                txtPrice.Text = model.Price + "";
                txtPricePercent.Text = model.PricePercent + "";
                txtPricePromotion.Text = model.PricePromotion + "";
                txtPriceSell.Text = model.PriceSell + "";
                txtPricesellOnline.Text = model.PricesellOnline + "";
                txtDepositPayment.Text = model.DepositPayment + "";
                rdoIsPaymentOnline.Checked = model.IsPaymentOnline.Value;
                //active chi nhánh & số lượng
                //lấy giá trị từ showroom
                var lstShowroomQuantity = model.pro_ProductCompanies;
                foreach (RepeaterItem item in rptShowRoom.Items)
                {
                    TextBox txtShowRoomQuantity = (TextBox)item.FindControl("txtShowRoomQuantity");
                    HiddenField hdfId = (HiddenField)item.FindControl("hdfId");
                    foreach (var row in lstShowroomQuantity)
                    {
                        if (row.company_CompanyInfoId == int.Parse(hdfId.Value))
                        {
                            txtShowRoomQuantity.Text = row.Quantity + "";
                        }
                    }
                }
                //lấy giá trị từ thuộc tính
                var lstAttribute = model.pro_ProductAttributes;
                for (int i = 0; i < rptAttribute.Items.Count; i++)
                {
                    HiddenField hdfId = (HiddenField)rptAttribute.Items[i].FindControl("hdfId");
                    foreach (var row in lstAttribute)
                    {
                        if (row.pro_AttributeId == int.Parse(hdfId.Value))
                        {
                            CheckBoxList chklist = (CheckBoxList)rptAttribute.Items[i].FindControl("rdoAttributeDetail");
                            foreach (ListItem item in chklist.Items)
                            {
                                if (row.pro_AttributeDetailId == int.Parse(item.Value)) { item.Selected = true; }
                            }
                        }
                    }
                }
            }
            else
            {
                rdoStatus.Checked = true;
                txtAccountantCode.Text = code + "_" + (pro_Product.pro_ProductPrices.Count + 1);
                txtImportCode.Text = code + "_" + (pro_Product.pro_ProductPrices.Count + 1);
                txtCode.Text = code + "_" + (pro_Product.pro_ProductPrices.Count + 1);
                txtName.Text = pro_Product.ProductName;
                //txtImage.Value = pro_Product.Image;
                imgImage.ImageUrl = "/" + pro_Product.Image;
                //txtImageLarge.Value = pro_Product.ImageLarge;
                imgImageLarge.ImageUrl = "/" + pro_Product.ImageLarge;
                imgSocialImage.ImageUrl = "/" + pro_Product.SocialImage;
                txtSeoTitle.Text = pro_Product.SeoTitle;
                txtSeoKeyword.Text = pro_Product.SeoKeyword;
                txtSeoDescription.Text = pro_Product.SeoDescription;
                txtSocialTitle.Text = pro_Product.SocialTitle;
                txtSocialDescription.Text = pro_Product.SocialDescription;
                txtNumOr.Text = (pro_Product.pro_ProductPrices.Count + 1) + "";
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        pro_Product = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["parent"]));
        string urlImageFolder = "upload/san-pham/" + DateTime.Now.Year + "/" + DateTime.Now.Month.ToString("00");
        System.IO.Directory.CreateDirectory(Server.MapPath("~/" + urlImageFolder));
        try
        {
            if (Request["Id"] == null)
            {
                var proPrice = new pro_ProductPrice()
                {
                    AccountantCode = txtAccountantCode.Text.Trim(),
                    Code = txtCode.Text.Trim(),
                    CreatedAt = DateTime.Now,
                    CreatedBy = Account.Employee.Email,
                    DepositPayment = double.Parse(txtDepositPayment.Text.Replace(",", "")),
                    //Image = txtImage.Value,
                    //ImageLarge = txtImageLarge.Value,
                    ImportCode = txtImportCode.Text.Trim(),
                    IsDisplay = true,
                    IsHome = true,
                    IsDeleted = false,
                    IsMain = rdoIsMain.Checked,
                    IsMenu = true,
                    IsPaymentOnline = rdoIsPaymentOnline.Checked,
                    IsStatus = rdoStatus.Checked,
                    Price = double.Parse(txtPrice.Text.Replace(",", "")),
                    PricePercent = double.Parse(txtPricePercent.Text.Replace(",", "")),
                    PriceImport = double.Parse(txtPrice.Text.Replace(",", "")),
                    PricePromotion = double.Parse(txtPricePromotion.Text.Replace(",", "")),
                    PriceSell = double.Parse(txtPriceSell.Text.Replace(",", "")),
                    PricesellOnline = double.Parse(txtPricesellOnline.Text.Replace(",", "")),
                    ProductName = txtName.Text,
                    pro_ProductId = int.Parse(Request["parent"]),
                    NumOr = int.Parse(txtNumOr.Text),
                    SeoTitle = txtSeoTitle.Text,
                    SeoDescription = txtSeoDescription.Text,
                    SeoKeyword = txtSeoKeyword.Text,
                    SocialDescription = txtSocialDescription.Text,
                    SocialTitle = txtSocialTitle.Text,
                    ViewCount = 0,
                    CodeNote = txtCodeNote.Text
                };
                if (fulImage.HasFile)
                {
                    string doihinh = fulImage.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "normal-" + txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    proPrice.Image = ImgSub;
                }
                else { proPrice.Image = pro_Product.Image; }
                if (fulImageLarge.HasFile)
                {
                    string doihinh = fulImageLarge.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "large-" + txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulImageLarge.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    proPrice.ImageLarge = ImgSub;
                }
                else { proPrice.ImageLarge = pro_Product.ImageLarge; }
                if (fulSocialImage.HasFile)
                {
                    string doihinh = fulSocialImage.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "social-" + txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulSocialImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    proPrice.SocialImage = ImgSub;
                }
                else { proPrice.SocialImage = pro_Product.SocialImage; }
                dbConnect.pro_ProductPrices.InsertOnSubmit(proPrice);
                //lấy giá trị từ showroom
                foreach (RepeaterItem item in rptShowRoom.Items)
                {
                    TextBox txtShowRoomQuantity = (TextBox)item.FindControl("txtShowRoomQuantity");
                    HiddenField hdfId = (HiddenField)item.FindControl("hdfId");
                    if (txtShowRoomQuantity != null)
                    {
                        var proCompany = new pro_ProductCompany()
                        {
                            company_CompanyInfoId = int.Parse(hdfId.Value),
                            CreatedAt = DateTime.Now,
                            IsStatus = true,
                            NumOr = 1,
                            pro_ProductPrice = proPrice,
                            Quantity = int.Parse(txtShowRoomQuantity.Text),
                            CreatedBy = Account.Employee.Email
                        };
                        dbConnect.pro_ProductCompanies.InsertOnSubmit(proCompany);
                    }
                }
                //lấy giá trị từ thuộc tính
                for (int i = 0; i < rptAttribute.Items.Count; i++)
                {
                    HiddenField hdfId = (HiddenField)rptAttribute.Items[i].FindControl("hdfId");
                    //Response.Write("<p><b>"+hdfId.Value+"</b><br>");
                    CheckBoxList chklist = (CheckBoxList)rptAttribute.Items[i].FindControl("rdoAttributeDetail");
                    foreach (ListItem item in chklist.Items)
                    {
                        if (item.Selected)
                        {
                            var detail = dbConnect.pro_AttributeDetails.Single(n => n.Id == int.Parse(item.Value));
                            var productAttribute = new pro_ProductAttribute()
                            {
                                pro_ProductPrice = proPrice,
                                ColorName = detail.ColorName,
                                CreatedAt = DateTime.Now,
                                CreatedBy = Account.Employee.Email,
                                Image = detail.Image,
                                IsStatus = true,
                                Name = detail.Name,
                                pro_ProductId= pro_Product.Id,
                                pro_AttributeDetailId = detail.Id,
                                pro_AttributeId = detail.pro_AttributeId,
                                NumOr = detail.NumOr
                            };
                            dbConnect.pro_ProductAttributes.InsertOnSubmit(productAttribute);
                        }
                    }
                }
                dbConnect.SubmitChanges();
                ClientAlerter.ShowAndGoto("Thêm kho & giá sản phẩm thành công", "/prodraftadmin/khosanpham/quanlysanpham/khovagia/list.aspx?parent=" + Request["parent"]);
            }
            else
            {
                var proPrice = dbConnect.pro_ProductPrices.Single(n => n.Id == int.Parse(Request["Id"]));
                proPrice.AccountantCode = txtAccountantCode.Text.Trim();
                proPrice.Code = txtCode.Text.Trim();
                proPrice.CreatedAt = DateTime.Now;
                proPrice.CreatedBy = Account.Employee.Email;
                proPrice.DepositPayment = double.Parse(txtDepositPayment.Text.Replace(",", ""));
                proPrice.CodeNote = txtCodeNote.Text;
                //proPrice.Image = txtImage.Value;
                //proPrice.ImageLarge = txtImageLarge.Value;
                if (fulImage.HasFile)
                {
                    string doihinh = fulImage.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "normal-" + txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    proPrice.Image = ImgSub;
                }
                if (fulImageLarge.HasFile)
                {
                    string doihinh = fulImageLarge.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "large-" + txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulImageLarge.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    proPrice.ImageLarge = ImgSub;
                }
                if (fulSocialImage.HasFile)
                {
                    string doihinh = fulSocialImage.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "social-" + txtName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulSocialImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    proPrice.SocialImage = ImgSub;
                }
                proPrice.SocialDescription = txtSocialDescription.Text;
                proPrice.SocialTitle = txtSocialTitle.Text;
                proPrice.SeoKeyword = txtSeoKeyword.Text;
                proPrice.SeoDescription = txtSeoDescription.Text;
                proPrice.SeoTitle = txtSeoTitle.Text;
                proPrice.NumOr = int.Parse(txtNumOr.Text);
                proPrice.ImportCode = txtImportCode.Text.Trim();
                proPrice.IsDisplay = true;
                proPrice.IsHome = true;
                proPrice.IsDeleted = false;
                proPrice.IsMain = rdoIsMain.Checked;
                proPrice.IsMenu = true;
                proPrice.IsPaymentOnline = rdoIsPaymentOnline.Checked;
                proPrice.IsStatus = rdoStatus.Checked;
                proPrice.Price = double.Parse(txtPrice.Text.Replace(",", ""));
                proPrice.PricePercent = double.Parse(txtPricePercent.Text.Replace(",", ""));
                proPrice.PriceImport = double.Parse(txtPrice.Text.Replace(",", ""));
                proPrice.PricePromotion = double.Parse(txtPricePromotion.Text.Replace(",", ""));
                proPrice.PriceSell = double.Parse(txtPriceSell.Text.Replace(",", ""));
                proPrice.PricesellOnline = double.Parse(txtPricesellOnline.Text.Replace(",", ""));
                proPrice.ProductName = txtName.Text;
                proPrice.pro_ProductId = int.Parse(Request["parent"]);
                dbConnect.SubmitChanges();
                //lấy giá trị từ showroom
                foreach (RepeaterItem item in rptShowRoom.Items)
                {
                    TextBox txtShowRoomQuantity = (TextBox)item.FindControl("txtShowRoomQuantity");
                    HiddenField hdfId = (HiddenField)item.FindControl("hdfId");
                    if (txtShowRoomQuantity != null)
                    {
                        var proC = dbConnect.pro_ProductCompanies.SingleOrDefault(n => n.company_CompanyInfoId == int.Parse(hdfId.Value) && n.pro_ProductPriceId == proPrice.Id);
                        if (proC == null)
                        {
                            var proCompany = new pro_ProductCompany()
                            {
                                company_CompanyInfoId = int.Parse(hdfId.Value),
                                CreatedAt = DateTime.Now,
                                IsStatus = true,
                                NumOr = 1,
                                pro_ProductPrice = proPrice,
                                Quantity = int.Parse(txtShowRoomQuantity.Text),
                                CreatedBy = Account.Employee.Email
                            };
                            dbConnect.pro_ProductCompanies.InsertOnSubmit(proCompany);
                        }
                        else
                        {
                            proC.Quantity = int.Parse(txtShowRoomQuantity.Text);
                            proC.UpdatedAt = DateTime.Now;
                            proC.UpdatedBy = Account.Employee.Email;
                        }
                    }
                }
                //lấy giá trị từ thuộc tính
                var arrtributes = dbConnect.pro_ProductAttributes.Where(n => n.pro_ProductPriceId == proPrice.Id);
                foreach (var item in arrtributes)
                {
                    dbConnect.pro_ProductAttributes.DeleteOnSubmit(item);
                }
                for (int i = 0; i < rptAttribute.Items.Count; i++)
                {
                    HiddenField hdfId = (HiddenField)rptAttribute.Items[i].FindControl("hdfId");
                    //Response.Write("<p><b>"+hdfId.Value+"</b><br>");
                    CheckBoxList chklist = (CheckBoxList)rptAttribute.Items[i].FindControl("rdoAttributeDetail");
                    foreach (ListItem item in chklist.Items)
                    {
                        if (item.Selected)
                        {
                            var detail = dbConnect.pro_AttributeDetails.Single(n => n.Id == int.Parse(item.Value));
                            var productAttribute = new pro_ProductAttribute()
                            {
                                pro_ProductPrice = proPrice,
                                ColorName = detail.ColorName,
                                CreatedAt = DateTime.Now,
                                CreatedBy = Account.Employee.Email,
                                Image = detail.Image,
                                IsStatus = true,
                                pro_ProductId= pro_Product.Id,
                                Name = detail.Name,
                                pro_AttributeDetailId = detail.Id,
                                pro_AttributeId = detail.pro_AttributeId,
                                NumOr = detail.NumOr
                            };
                            dbConnect.pro_ProductAttributes.InsertOnSubmit(productAttribute);
                        }
                    }
                }
                dbConnect.SubmitChanges();
                ClientAlerter.ShowAndGoto("Cập nhật kho & giá sản phẩm thành công", "/prodraftadmin/khosanpham/quanlysanpham/khovagia/list.aspx?parent=" + Request["parent"]);
            }
        }
        catch (Exception ex) { ClientAlerter.Show(this, "Lưu dữ liệu thất bại. Vui lòng kiểm tra lại"); }
    }

    protected void rptAttribute_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var hdfId = e.Item.FindControl("hdfId") as HiddenField;
        var rdoAttributeDetail = e.Item.FindControl("rdoAttributeDetail") as CheckBoxList;

        rdoAttributeDetail.DataSource = dbConnect.pro_AttributeDetails.Where(n => n.IsStatus == true && n.pro_AttributeId == int.Parse(hdfId.Value))
            .OrderBy(n => n.NumOr)
            .Select(n => new { n.Id, Name = n.Name + "(" + n.Code.Trim() + ")" });
        rdoAttributeDetail.DataTextField = "Name";
        rdoAttributeDetail.DataValueField = "Id";
        rdoAttributeDetail.DataBind();

        foreach (ListItem item in rdoAttributeDetail.Items)
        {
            item.Attributes["data-code"] = item.Text.Substring(item.Text.IndexOf('(')).Replace("(", "").Replace(")", "");
        }
    }
}

using Database;
using DevExpress.Web;
using dxtLib.WebProvider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Siteadmin_cauhinh_banner_DanhSachBanner : AdminPageUtils
{
    public pro_Product pro_Product { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        loaddata();
    }
    private void loaddata()
    {
        pro_Product = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["parent"]));
        var models = pro_Product.pro_ProductPrices.Where(n => n.IsDeleted == false || n.IsDeleted == null)
            .Select(n => new
            {
                n.Id,
                n.ProductName,
                n.IsMain,
                n.IsStatus,
                n.IsPaymentOnline,
                n.Price,
                n.PricePercent,
                n.PriceSell,
                n.PricesellOnline,
                n.Image,
                n.Code,
                Quanity = n.pro_ProductCompanies.Sum(m => m.Quantity)
            })
            .OrderByDescending(n => n.Id);
        ASPxGVDS.DataSource = models;
        ASPxGVDS.DataBind();
        //ASPxGVDS.ExpandAll();
        //ASPxGVDS.ClientSideEvents.SelectionChanged = "function(s,e){s.GetSelectedFieldValues('Id',OnGetValues);}";
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
        if (e.DataColumn.FieldName == "IsStatus")
        {
            string visible = e.GetValue("IsStatus").ToString();
            if (visible == "False")
            {
                ImageButton imgtt = ASPxGVDS.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "imgTT") as ImageButton;
                imgtt.ImageUrl = "/prodraftadmin/images/hidden.gif";
            }
        }
        if (e.DataColumn.FieldName == "IsPaymentOnline")
        {
            string visible = e.GetValue("IsPaymentOnline").ToString();
            if (visible == "False")
            {
                ImageButton imgtt = ASPxGVDS.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "imgPaymentOnline") as ImageButton;
                imgtt.ImageUrl = "/prodraftadmin/images/hidden.gif";
            }
        }
        if (e.DataColumn.FieldName == "IsMain")
        {
            string visible = e.GetValue("IsMain").ToString();
            if (visible == "False")
            {
                ImageButton imgtt = ASPxGVDS.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "imgMain") as ImageButton;
                imgtt.ImageUrl = "/prodraftadmin/images/hidden.gif";
            }
        }
        if (e.DataColumn.FieldName == "ProductName")
        {
            string Id = e.GetValue("Id").ToString();
            Label lblAttribute = ASPxGVDS.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblAttribute") as Label;
            var itemAttribute = dbConnect.pro_ProductAttributes.Where(n => n.pro_ProductPriceId == int.Parse(Id)).OrderBy(n => n.pro_Attribute.NumOr);
            if (itemAttribute.Count() == 0)
            {
                lblAttribute.Text = "<ul><li>Không có thuộc tính</li></ul>";
            }
            else
            {
                string attribute = "<ul>";
                foreach (var item in itemAttribute)
                {
                    attribute += "<li>" + item.Name + "</li>";
                }
                attribute += "</ul>";
                lblAttribute.Text = attribute;
            }

        }
    }
    protected void btnDelete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton l = sender as ImageButton;
            pro_ProductPrice model = dbConnect.pro_ProductPrices.Single(m => m.Id == int.Parse(l.CommandArgument));
            model.IsDeleted = true; model.IsStatus = false;
            model.DeletedBy = Account.Employee.Email;
            model.DeletedAt = DateTime.Now;
            dbConnect.SubmitChanges();
            loaddata();
        }
        catch { }
    }

    protected void imgTT_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_ProductPrice model = dbConnect.pro_ProductPrices.Single(m => m.Id == int.Parse(l.CommandArgument));
        model.IsStatus = !model.IsStatus;
        model.UpdatedBy = Account.Employee.Email;
        model.UpdatedAt = DateTime.Now;
        dbConnect.SubmitChanges();
        loaddata();
    }

    protected void imgMain_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_ProductPrice model = dbConnect.pro_ProductPrices.Single(m => m.Id == int.Parse(l.CommandArgument));
        model.IsMain = !model.IsMain;
        model.UpdatedBy = Account.Employee.Email;
        model.UpdatedAt = DateTime.Now;
        dbConnect.SubmitChanges();
        loaddata();
    }
    protected void imgPaymentOnline_Click1(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_ProductPrice model = dbConnect.pro_ProductPrices.Single(m => m.Id == int.Parse(l.CommandArgument));
        model.IsPaymentOnline = !model.IsPaymentOnline;
        model.UpdatedBy = Account.Employee.Email;
        model.UpdatedAt = DateTime.Now;
        dbConnect.SubmitChanges();
        loaddata();
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            string id = "";

            // *------------------ Kiểm tra item được check và != enable-----------------------------------------------
            for (int i = 0; i < ASPxGVDS.VisibleRowCount; i++)
            {
                // Nếu item được check
                if (ASPxGVDS.Selection.IsRowSelected(i) == true)
                {
                    try
                    {
                        pro_ProductPrice model = dbConnect.pro_ProductPrices.Single(m => m.Id == int.Parse(ASPxGVDS.GetRowValues(i, "Id").ToString()));
                        model.IsDeleted = true; model.IsStatus = false;
                        model.DeletedBy = Account.Employee.Email;
                        model.DeletedAt = DateTime.Now;
                    }
                    catch { }
                }
            }
            dbConnect.SubmitChanges();
            Response.Redirect(Request.RawUrl);
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }

    protected void btnCopy_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton l = sender as ImageButton;
            pro_ProductPrice model = dbConnect.pro_ProductPrices.Single(m => m.Id == int.Parse(l.CommandArgument));
            var modelCopy = new pro_ProductPrice
            {
                AccountantCode = model.AccountantCode,
                Banner = model.Banner,
                Code = model.Code,
                CodeNote = model.CodeNote,
                CreatedAt = DateTime.Now,
                CreatedBy = Account.Employee.Email,
                DepositPayment = model.DepositPayment,
                Description = model.Description,
                Image = model.Image,
                ImageLarge = model.ImageLarge,
                ImportCode = model.ImportCode,
                IsBanner = model.IsBanner,
                IsDisplay = model.IsDisplay,
                IsHome = model.IsHome,
                IsDeleted = model.IsDeleted,
                IsMain = model.IsMain,
                IsMenu = model.IsMenu,
                IsPaymentOnline = model.IsPaymentOnline,
                IsStatus = model.IsStatus,
                LinkBanner = model.LinkBanner,
                NumOr = model.NumOr,
                Price = model.Price,
                PriceImport = model.PriceImport,
                PricePercent = model.PricePercent,
                PricePromotion = model.PricePromotion,
                PriceSell = model.PriceSell,
                PricesellOnline = model.PricesellOnline,
                ProductHeight = model.ProductHeight,
                ProductLength = model.ProductLength,
                ProductName = "Copy_"+model.ProductName,
                ProductWidth = model.ProductWidth,
                pro_ProductId = model.pro_ProductId,
                Quantity = model.Quantity,
                SeoDescription = model.SeoDescription,
                SeoKeyword = model.SeoKeyword,
                SeoTitle = model.SeoTitle,
                SocialDescription = model.SocialDescription,
                SocialImage = model.SocialImage,
                SocialTitle = model.SocialTitle,
                Summary = model.Summary,
                ViewCount = model.ViewCount
            };
            dbConnect.pro_ProductPrices.InsertOnSubmit(modelCopy);
            foreach (var item in model.pro_ProductPriceImages)
            {
                var image = new pro_ProductPriceImage()
                {
                    CreatedAt = DateTime.Now,
                    CreatedBy = Account.Employee.Email,
                    Image = item.Image,
                    ImageLarge = item.ImageLarge,
                    NumOr = item.NumOr + 1,
                    IsStatus = item.IsStatus,
                    ProductName = item.ProductName,
                    pro_ProductPrice = modelCopy
                };
                dbConnect.pro_ProductPriceImages.InsertOnSubmit(image);
            }
            foreach (var item in model.pro_ProductPriceVideos)
            {
                var video = new pro_ProductPriceVideo()
                {
                    CreatedAt = DateTime.Now,
                    CreatedBy = Account.Employee.Email,
                    Image = item.Image,
                    ImageLarge = item.ImageLarge,
                    NumOr = item.NumOr + 1,
                    IsStatus = item.IsStatus,
                    ProductName = item.ProductName,
                    pro_ProductPrice = modelCopy,
                    Summary = item.Summary,
                    Title = item.Title,
                    YoutubeLink = item.YoutubeLink
                };
                dbConnect.pro_ProductPriceVideos.InsertOnSubmit(video);
            }
            foreach (var item in model.pro_ProductAttributes)
            {
                var attr = new pro_ProductAttribute()
                {
                    CreatedAt = DateTime.Now,
                    CreatedBy = Account.Employee.Email,
                    Image = item.Image,
                    NumOr = item.NumOr + 1,
                    IsStatus = item.IsStatus,
                    pro_ProductPrice = modelCopy,
                    ColorName=item.ColorName,
                    Name=item.Name,
                    pro_ProductId= model.Id,
                    pro_AttributeDetailId =item.pro_AttributeDetailId,
                    pro_AttributeId=item.pro_AttributeId
                };
                dbConnect.pro_ProductAttributes.InsertOnSubmit(attr);
            }
            foreach (var item in model.pro_ProductCompanies)
            {
                var company = new pro_ProductCompany()
                {
                    CreatedAt = DateTime.Now,
                    CreatedBy = Account.Employee.Email,
                    NumOr = item.NumOr + 1,
                    IsStatus = item.IsStatus,
                    pro_ProductPrice = modelCopy,
                    company_CompanyInfoId=item.company_CompanyInfoId,
                    Quantity=item.Quantity
                };
                dbConnect.pro_ProductCompanies.InsertOnSubmit(company);
            }
            dbConnect.SubmitChanges();
            Response.Redirect(Request.RawUrl);
        }
        catch { }
    }
}
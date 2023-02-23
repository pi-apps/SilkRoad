using Database;
using dxtLib.WebProvider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class prodraftadmin_khosanpham_quanlysanpham_import : AdminPageUtils
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        string urlImageFolder = "upload/import-product/" + DateTime.Now.Year + "/" + DateTime.Now.Month.ToString("00");
        System.IO.Directory.CreateDirectory(Server.MapPath("~/" + urlImageFolder));
        lblMessage.Visible = false;
        if (FileUpload1.HasFile)
        {
            var product = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"]));
            string doihinh = FileUpload1.FileName.Trim();
            doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
            string hinh_web = "import-" + DateTime.Now.Ticks + doihinh;
            FileUpload1.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
            ExcelUtils utils = new ExcelUtils();
            List<ExcelProduct> lst = utils.readExcel(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web), hinh_web);
            foreach (var item in lst)
            {
                string code = product.Code+item.Attribute;
                
                //check có thêm sản phẩm hay chưa?
                var flag = product.pro_ProductPrices.Where(n=>n.IsStatus==true).Where(n=>n.IsDeleted==false||n.IsDeleted==null).Where(n => n.Code == code);
                if (flag.Count() == 0)//thêm mới
                {
                    var price = new pro_ProductPrice()
                    {
                        AccountantCode = code,
                        Code = code,
                        CodeNote = "",
                        CreatedAt = DateTime.Now,
                        CreatedBy = Account.Employee.Email,
                        DepositPayment = item.Price - item.PricePromotion,
                        Price = item.Price,
                        Description = product.Description,
                        PriceImport = item.Price,
                        PricePromotion = item.PricePromotion,
                        Image = product.Image,
                        Banner = product.Banner,
                        ImageLarge = product.ImageLarge,
                        ImportCode = code,
                        IsBanner = product.IsBanner,
                        IsDeleted = false,
                        IsDisplay = false,
                        IsHome = false,
                        IsMain = false,
                        IsMenu = false,
                        IsStatus = true,
                        IsPaymentOnline = false,
                        LinkBanner = product.LinkBanner,
                        NumOr = item.STT,
                        PriceSell = item.Price - item.PricePromotion,
                        PricesellOnline = item.Price - item.PricePromotion,
                        PricePercent = item.PricePromotion==0?0:Math.Ceiling(((item.PricePromotion * 100) / item.Price)),
                        ProductHeight = product.ProductHeight,
                        ProductLength = product.ProductLength,
                        ProductName=product.ProductName,
                        ProductWidth=product.ProductWidth,
                        SeoDescription=product.SeoDescription,
                        Quantity=0,
                        SeoKeyword=product.SeoKeyword,
                        SeoTitle=product.SeoTitle,
                        SocialDescription=product.SocialDescription,
                        ViewCount=10,
                        SocialImage=product.SocialImage,
                        SocialTitle=product.SocialTitle,
                        Summary=product.Summary,
                        pro_Product=product
                    };
                    dbConnect.pro_ProductPrices.InsertOnSubmit(price);
                    //import số lượng
                    foreach (var com in dbConnect.company_CompanyInfos)
                    {
                        var comp = new pro_ProductCompany()
                        {
                            IsStatus = true,
                            CreatedAt = DateTime.Now,
                            company_CompanyInfoId = com.Id,
                            NumOr = 1,
                            pro_ProductPrice = price,
                            Quantity = 20,
                            CreatedBy = Account.Employee.Email
                        };
                        dbConnect.pro_ProductCompanies.InsertOnSubmit(comp);
                    }
                    //import thuộc tính
                    var lstAttr = utils.getCodes(item.Attribute.Trim());
                    foreach (var att in lstAttr)
                    {
                        var mAtt = dbConnect.pro_AttributeDetails.SingleOrDefault(n => n.Code == att);
                        if (mAtt != null)
                        {
                            var pAtt = new pro_ProductAttribute()
                            {
                                ColorName=mAtt.ColorName,
                                CreatedAt=DateTime.Now,
                                CreatedBy=Account.Employee.Email,
                                Image=mAtt.Image,
                                IsStatus=true,
                                pro_ProductId= product.Id,
                                Name =mAtt.Name,
                                NumOr=mAtt.NumOr,
                                pro_AttributeDetailId=mAtt.Id,
                                pro_AttributeId=mAtt.pro_AttributeId,
                                pro_ProductPrice=price
                            };
                            dbConnect.pro_ProductAttributes.InsertOnSubmit(pAtt);
                        }
                    }
                    
                }
                else//chỉnh sửa
                {
                    var productPrice = flag.First();
                    productPrice.UpdatedAt = DateTime.Now;
                    productPrice.UpdatedBy = Account.Employee.Email;
                    productPrice.Price = item.Price;
                    productPrice.PriceImport = item.Price;
                    productPrice.PriceSell = item.Price - item.PricePromotion;
                    productPrice.PricesellOnline = productPrice.PriceSell;
                    productPrice.PricePercent = item.PricePromotion == 0 ? 0 : Math.Ceiling(((item.PricePromotion * 100) / item.Price));
                    productPrice.PricePromotion = item.PricePromotion;
                    productPrice.NumOr = item.STT;
                    productPrice.DepositPayment = item.Price - item.PricePromotion;
                }
                dbConnect.SubmitChanges();
            }
            lblMessage.Visible = true;
            lblMessage.Text = "Cập nhật thành công";
        }
        else
        {
            ClientAlerter.Show(this, "Vui lòng chọn file cần import");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database;
public partial class danhmuc_left_slidebarLeftUserControl : PublicUserControl
{
    public List<pro_Category> lstCategory { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        var seo = dbConnect.store_ShopRentals.Single(n => n.Id == int.Parse(Request["shopRentalId"]));
        //từ khóa
        //var itemTuKhoaPhoBien = dbConnect.pro_ProductTags.Where(m => m.pro_Product.IsStatus == true).Select(n => n.pro_Tag).Distinct();
        //rptTagProducts.DataSource = itemTuKhoaPhoBien;
        //rptTagProducts.DataBind();
        //danh mục new
        var lstCategoryShop = dbConnect.getCategoryByShopRentalId(seo.Id).ToList();
        lstCategory = new List<pro_Category>();
        foreach (var item in lstCategoryShop)
        {
            lstCategory.Add(dbConnect.pro_Categories.Single(n => n.Id == item.Id));
        }
        //danh mục
        var lstCategoryProduct = lstCategory.Where(n => n.IsStatus == true && n.IsDeleted == false && n.Parent == 0);
        rptCateProDM.DataSource = lstCategoryProduct.OrderBy(n => n.NumOr)
            .Select(n => new {
                n.Id,
                n.Name,
                shopRentalId=seo.Id,
                n.UrlSeo,
                Count = dbConnect.pro_Categories.Where(m => n.IsStatus == true && m.IsDeleted == false && m.Parent == n.Id).Count()
            });
        rptCateProDM.DataBind();
    }

    protected void rptCateProDM_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var hdfId = e.Item.FindControl("hdfId") as HiddenField;
        var ltrMenuSub = e.Item.FindControl("ltrMenuSub") as Literal;
        var lstCategorySub = lstCategory.Where(n => n.IsStatus == true && n.IsDeleted == false && n.Parent == int.Parse(hdfId.Value)).OrderBy(n => n.NumOr);
        if (lstCategorySub.Count() > 0)
        {
            string resultSubMenu = @"<ul role='menu' class='sub-menu'>";
            foreach (var sub in lstCategorySub)
            {
                var lstCategorySub1 = lstCategory.Where(n => n.IsStatus == true && n.IsDeleted == false && n.Parent == sub.Id).OrderBy(n => n.NumOr);
                string resultSubMenu2 = "";
                if (lstCategorySub1.Count() > 0)
                {
                    resultSubMenu2 += "<ul role='menu' class='sub-menu'>";
                    foreach (var sub2 in lstCategorySub1)
                    {
                        resultSubMenu2 += @"<li id='menu-item-new-" + sub2.Id + "' class='menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-" + sub2.Id + "'><a title='" + sub2.Name + "' href='/gian-hang/san-pham-gian-hang/"+sub2.Name.RemoveSymbol()+"-"+sub2.Id+"-"+ Request["shopRentalId"] + ".html'><i class='fa fa-angle-right' aria-hidden='true'></i>&nbsp;" + sub2.Name + "</a></li>";
                    }
                    resultSubMenu2 += "</ul>";
                }
                resultSubMenu += ("<li id='menu-item-new-" + sub.Id + "' class='menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-" + sub.Id + " dropdown'>" + "<a title='" + sub.Name + "' href='/gian-hang/san-pham-gian-hang/"+ sub.Name.RemoveSymbol() + "-"+ sub.Id+ "-"+ Request["shopRentalId"] + ".html'><i class='fa fa-angle-right' aria-hidden='true'></i>&nbsp;" + sub.Name + "</a>" + resultSubMenu2 + "</li>");
            }
            resultSubMenu += "</ul>";
            ltrMenuSub.Text = resultSubMenu;
        }
    }
}
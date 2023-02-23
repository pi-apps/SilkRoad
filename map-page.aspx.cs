using Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class map : PublicUser
{
    public other_Webpage seo { get; set; }
    public string strLocations { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            urlRequest.Value = urlDomainShare + Request.RawUrl.Substring(0, Request.RawUrl.IndexOf('?'));
        }
        catch
        {
            urlRequest.Value = urlDomainShare + Request.RawUrl;
        }
        seo = dbConnect.other_Webpages.Single(n => n.Id == 66);
        if (!IsPostBack)
        {
            seo.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
        }
        //load product
        if (!IsPostBack)
        {
            ddlSort.DataSource = SortProductModelUtils.getListSort();
            ddlSort.DataValueField = "Value";
            ddlSort.DataTextField = "Text";
            ddlSort.DataBind();
            ddlSort.SelectedValue = "7";
            

            ddlVungMien.DataSource = dbConnect.tblRegions.Where(n => n.IsStatus == true);
            ddlVungMien.DataValueField = "Id";
            ddlVungMien.DataTextField = "Name";
            ddlVungMien.DataBind();
            ddlVungMien.Items.Insert(0, new ListItem("Vùng miền", ""));

            ProductCategorysUtils.loadDropDownListPublic(ddlDanhMuc);
        }
        if (Request["cate"] != null) { ddlDanhMuc.SelectedValue = Request["cate"] + ""; }
        if (Request["reg"] != null) { ddlVungMien.SelectedValue = Request["reg"] + ""; }
        if (Request["sort"] != null) { ddlSort.SelectedValue = Request["sort"] + ""; }
        if (Request["key"] != null) { txtKeyword.Text = Request["key"] + ""; }
        string cateIds = "";
        int reg = 0;
        if (ddlVungMien.SelectedValue != "") { reg = int.Parse(ddlVungMien.SelectedValue); }
        try
        {
            var pro_Category = dbConnect.pro_Categories.Single(n => n.Id == int.Parse(ddlDanhMuc.SelectedValue));
            var categoryResults = dbConnect.proGetChildLevelCategory(pro_Category.Id, pro_Category.Name).ToList();
            cateIds = string.Join(",", categoryResults.Distinct().Select(n => n.child).Distinct());
        }
        catch { }
        var items = dbConnect.getListShop(txtKeyword.Text, reg, cateIds, int.Parse(ddlSort.SelectedValue))
            .Distinct()
            .Select(n => new
            {
                n.Id,
                n.Name,
                n.Price,
                n.Banner,
                n.StatusCss,
                n.StatusName,
                n.Code,
                n.ExchangeRate,
                n.Summary,
                n.RankingCount
            })
            .ToList().Distinct();
        var lstLocation = new List<store_ShopLocation>();
        foreach (var item in items)
        {
            foreach (var loc in dbConnect.store_ShopLocations.Where(n => n.store_ShopRentalId == item.Id
            && n.IsStatus == true && n.Long != "" && n.Lat != ""
            && n.Long != null && n.Lat != null))
            {
                strLocations += (","+ "['"+item.Name.Replace("'","\"")+"', "+loc.Lat+", "+loc.Long+", "+loc.Id+"]");
            }
        }
        if (strLocations.Length > 0)
        {
            strLocations = strLocations.Substring(1);
        }
    }
}
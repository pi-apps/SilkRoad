using Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gianhang_Default : PublicUser
{
    public other_Webpage seo { get; set; }
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
        seo = dbConnect.other_Webpages.Single(n => n.Id == 64);
        if (!IsPostBack)
        {
            seo.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
        }
        //load product
        if (!IsPostBack)
        {
            ddlSort.DataSource = SortProductModelUtils.getListSortProductAuction();
            ddlSort.DataValueField = "Value";
            ddlSort.DataTextField = "Text";
            ddlSort.DataBind();
            ddlSort.SelectedValue = "5";

            ddlPageSize.DataSource = SortProductModelUtils.getListPageSize();
            ddlPageSize.DataValueField = "Value";
            ddlPageSize.DataTextField = "Text";
            ddlPageSize.DataBind();
            ddlPageSize.SelectedValue = "10";
            ProductCategorysUtils.loadDropDownListPublic(ddlDanhMuc);
        }
        if (Request["cate"] != null) { ddlDanhMuc.SelectedValue = Request["cate"] + ""; }
        if (Request["ps"] != null) { ddlPageSize.SelectedValue = Request["ps"] + ""; }
        if (Request["sort"] != null) { ddlSort.SelectedValue = Request["sort"] + ""; }
        if (Request["key"] != null) { txtKeyword.Text = Request["key"] + ""; }
        string cateIds = "";
        try
        {
            var pro_Category = dbConnect.pro_Categories.Single(n => n.Id == int.Parse(ddlDanhMuc.SelectedValue));
            var categoryResults = dbConnect.proGetChildLevelCategory(pro_Category.Id, pro_Category.Name).ToList();
            cateIds = string.Join(",", categoryResults.Distinct().Select(n => n.child).Distinct());
        }
        catch { }
        var items = dbConnect.proProductAuction(txtKeyword.Text, cateIds, int.Parse(ddlSort.SelectedValue))
            .Distinct()
            .ToList().Distinct();
        Pager p = new Pager(int.Parse(ddlPageSize.SelectedValue), items.Distinct().Count(), 5);
        Literal1.Text = p.NavigationCategoryNewPublic2();
        rptProduct.DataSource = items.Distinct().Skip(p.PageSkip).Take(p.PageSize);
        rptProduct.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }

    protected void rptProduct_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var hdfId = e.Item.FindControl("hdfId") as HiddenField;
        var ltrGiaDat = e.Item.FindControl("ltrGiaDat") as Literal;
        var ltrNguoiDat = e.Item.FindControl("ltrNguoiDat") as Literal;
        var ltrThoiGian = e.Item.FindControl("ltrThoiGian") as Literal;
        var lstAction = dbConnect.pro_HistoryProductAuctions.Where(n => n.pro_ProductId == int.Parse(hdfId.Value)).OrderByDescending(n=>n.PriceAuction);
        if (lstAction.Count() == 0)
        {
            ltrGiaDat.Text = "---";
            ltrNguoiDat.Text = "---";
            ltrThoiGian.Text = "---";
        }
        else
        {
            try {
                var auction = lstAction.First();
                ltrGiaDat.Text = auction.PriceAuction.Value.ToString("#,0.##")+ "π";
                ltrNguoiDat.Text = auction.store_Customer.Code;
                ltrThoiGian.Text = auction.CreatedAt.Value.ToString("dd/MM/yyyy HH:mm:ss");
            } catch
            {
                ltrGiaDat.Text = "---";
                ltrNguoiDat.Text = "---";
                ltrThoiGian.Text = "---";
            }
        }
        var ltrDatGiaThau = e.Item.FindControl("ltrDatGiaThau") as Literal;
        var product = dbConnect.pro_Products.Single(n => n.Id == int.Parse(hdfId.Value));
        string UrlBuy = "";
        if (Session["PiglobalUser"] == null)
        {
            UrlBuy = "<a class='btn-mua' href='/member/dang-nhap.aspx'><i class='fa fa-gavel' aria-hidden='true'></i>&nbsp; Đấu giá</a>";
        }
        else
        {
            var customer1 = Session["PiglobalUser"] as store_Customer;
            var customer = dbConnect.store_Customers.Single(n => n.Id == customer1.Id);
            if (customer.AmountBalance >= product.PriceAuction)
            {
                UrlBuy = "<a class='btn-mua' onclick='popupdatgiathau("+product.Id+");' href='javascript:void(0);'><i class='fa fa-gavel' aria-hidden='true'></i>&nbsp; Đấu giá</a>";
            }
            else
            {
                UrlBuy = "<a class='btn-mua' href='javascript:void(0);' onclick='callPopupKhongDuTienDauGia("+ customer.AmountBalance.Value.ToString("#.##0") + ");'><i class='fa fa-gavel' aria-hidden='true'></i>&nbsp; Đấu giá</a>";
            }
        }
        ltrDatGiaThau.Text = UrlBuy;
    }
}
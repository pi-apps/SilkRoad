
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
        var models = dbConnect.pro_ProductComments.Where(n => n.IsDeleted == false || n.IsDeleted == null).OrderByDescending(n => n.Id)
            .Select(n=>new {
                n.ScoreRate,n.FullName,n.Email,n.CreatedAt,n.IsStatus,
                n.Comment,
                n.Id,
                n.pro_Product.ProductName,
                n.pro_Product.Code
            })
            ;
        ASPxGVDS.DataSource = models;
        ASPxGVDS.DataBind();
        ASPxGVDS.ExpandAll();
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
    }
    protected void btnDelete_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            ImageButton l = sender as ImageButton;
            pro_ProductComment model = dbConnect.pro_ProductComments.Single(m => m.Id == int.Parse(l.CommandArgument));
            model.IsDeleted = true; model.IsStatus = false;
            model.DeletedBy = Account.Employee.Email;
            model.DeletedAt = DateTime.Now;
            dbConnect.SubmitChanges();
            Response.Redirect(Request.RawUrl);
        }
        catch { }
    }

    protected void imgTT_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_ProductComment model = dbConnect.pro_ProductComments.Single(m => m.Id == int.Parse(l.CommandArgument));
        model.IsStatus = !model.IsStatus;
        model.UpdatedBy = Account.Employee.Email;
        model.UpdatedAt = DateTime.Now;
        dbConnect.SubmitChanges();
        Response.Redirect(Request.RawUrl);
    }
}
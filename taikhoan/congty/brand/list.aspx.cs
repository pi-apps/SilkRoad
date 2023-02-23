
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
    protected void Page_Load(object sender, EventArgs e)
    {
        loaddata();
    }
    private void loaddata()
    {
        var models = dbConnect.company_CompanyInfos.OrderByDescending(n => n.CreatedAt);
        ASPxGVDS.DataSource = models;
        ASPxGVDS.DataBind();
        ASPxGVDS.ExpandRow(0);
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
        if (e.DataColumn.FieldName == "Active")
        {
            string visible = e.GetValue("Active").ToString();
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
            company_CompanyInfo model = dbConnect.company_CompanyInfos.Single(m => m.Id == int.Parse(l.CommandArgument));
            dbConnect.company_CompanyInfos.DeleteOnSubmit(model);
            dbConnect.SubmitChanges();
            loaddata();
        }
        catch { }
    }

    protected void imgTT_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        company_CompanyInfo model = dbConnect.company_CompanyInfos.Single(m => m.Id == int.Parse(l.CommandArgument));
        model.Active = !model.Active;
        model.UpdatedBy = Account.Employee.Email;
        model.UpdatedAt = DateTime.Now;
        dbConnect.SubmitChanges();
        loaddata();
    }
}
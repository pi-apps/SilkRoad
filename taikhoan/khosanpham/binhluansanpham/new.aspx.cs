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
    protected void Page_PreRender(object sender, EventArgs e)
    {
        var Id = Request["Id"];
        if (!IsPostBack)
        {
            if (Id != null)
            {
                var model = dbConnect.pro_ProductComments.Single(n => n.Id == int.Parse(Request["Id"]));
                txtId.Value = model.Id + "";
                txtSummary.Value = model.Comment;
                rdoStatus.Checked = model.IsStatus.Value;
            }
            else
            {
                rdoStatus.Checked = true;
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        var ip = Request.ServerVariables["REMOTE_ADDR"];
        try
        {
            if (Request["Id"] == null)
            {
                
            }
            else
            {
                var model = dbConnect.pro_ProductComments.Single(n => n.Id == int.Parse(Request["Id"]));
                model.IsStatus = rdoStatus.Checked;
                model.Comment = txtSummary.Value;
                model.UpdatedAt = DateTime.Now;
                model.UpdatedBy = Account.Email;
                dbConnect.SubmitChanges();
                ClientAlerter.ShowAndGoto("Cập nhật đánh giá sản phẩm thành công", "list.aspx");
            }
        }
        catch (Exception ex) { ClientAlerter.Show(this, "Lưu dữ liệu thất bại. Vui lòng kiểm tra lại"); }
    }
    
}
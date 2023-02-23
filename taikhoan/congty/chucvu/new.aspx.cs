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
    protected void Page_PreRender(object sender, EventArgs e)
    {
        var Id = Request["Id"];
        if (!IsPostBack)
        {
            if (Id != null)
            {
                var model = dbConnect.company_Positions.Single(n => n.Id == int.Parse(Id));
                txtId.Value = model.Id + "";
                txtName.Text = model.Name;
                rdoStatus.Checked = model.Active.Value;
                txtNumOr.Text = model.SortOrder + "";
            }
            else
            {
                rdoStatus.Checked = true;
                txtNumOr.Text = (dbConnect.company_Positions.Count() + 1) + "";
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool flag = false;
        string message = "";
        try
        {
            if (txtId.Value == null || txtId.Value == "")
            {
                #region Create
                var model = new company_Position()
                {
                    CreatedAt = DateTime.Now,
                    CreatedBy = Account.Employee.Email,
                    Name = txtName.Text,
                    Active = rdoStatus.Checked,
                    SortOrder = int.Parse(txtNumOr.Text),
                    IsDeleted=false
                };
                dbConnect.company_Positions.InsertOnSubmit(model);
                message = "Thêm mới chức vụ thành công.";
                #endregion
            }
            else
            {
                var model = dbConnect.company_Positions.Single(n => n.Id == int.Parse(txtId.Value));
                model.UpdatedAt = DateTime.Now; model.UpdatedBy = Account.Employee.Email;
                model.Name = txtName.Text;
                model.SortOrder = int.Parse(txtNumOr.Text);
                model.Active = rdoStatus.Checked;
                message = "Cập nhật chức vụ thành công.";
            }
            dbConnect.SubmitChanges();
            flag = true;
        }
        catch{ }
        if (flag)
        {
            ClientAlerter.ShowAndGoto(message, "/prodraftadmin/congty/chucvu/list.aspx");
        }
        else
        {
            ClientAlerter.Show(this, "Lưu dữ liệu thất bại. Vui lòng kiểm tra lại");
        }
    }
}
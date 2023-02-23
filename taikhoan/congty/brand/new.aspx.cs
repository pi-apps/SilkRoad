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
            ddlBrandType.DataSource = BrandTypeUtils.getList();
            ddlBrandType.DataValueField = "Name";
            ddlBrandType.DataTextField = "Name";
            ddlBrandType.DataBind();
            if (Id != null)
            {
                var model = dbConnect.company_CompanyInfos.Single(n => n.Id == int.Parse(Id));
                txtId.Value = model.Id + "";
                txtName.Text = model.Name;
                ddlBrandType.SelectedValue = model.BrandType + "";
                rdoStatus.Checked = model.Active.Value;
                txtNumOr.Text = model.SortOrder + "";
                txtAddress.Text = model.Address;
                txtPersonalManager.Text = model.PersonalManager;
                txtPhone.Text = model.Phone;
                txtHotLine.Text = model.HotLine;
                txtEmail.Text = model.Email;
                txtFax.Text = model.Fax;
                txtGoogleMap.Text = model.GoogleMap;
                txtCode.Text = model.Code;
                rdoIsDisplayWeb.Checked = model.IsDisplayWeb.Value;
            }
            else
            {
                rdoStatus.Checked = true; txtCode.Text = string.Format("{0:CN0000}", dbConnect.company_CompanyInfos.Count() + 1);
                txtNumOr.Text = (dbConnect.company_CompanyInfos.Count() + 1) + "";
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
                var model = new company_CompanyInfo()
                {
                    CreatedAt = DateTime.Now,
                    CreatedBy = Account.Employee.Email,
                    Name = txtName.Text,
                    Active = rdoStatus.Checked,
                    SortOrder = int.Parse(txtNumOr.Text),
                    GoogleMap=txtGoogleMap.Text,
                    Fax=txtFax.Text,
                    Email=txtEmail.Text,
                    Address=txtAddress.Text,
                    BrandType=ddlBrandType.SelectedValue,
                    HotLine=txtHotLine.Text,
                    Phone=txtPhone.Text,
                    IpNetwork="",
                    Tel="",Code=txtCode.Text,
                    IsDeleted=false,
                    IsDisplayWeb=rdoIsDisplayWeb.Checked,
                    PersonalManager=txtPersonalManager.Text
                };
                dbConnect.company_CompanyInfos.InsertOnSubmit(model);
                message = "Thêm mới chi nhánh thành công.";
                #endregion
            }
            else
            {
                var model = dbConnect.company_CompanyInfos.Single(n => n.Id == int.Parse(txtId.Value));
                model.UpdatedAt = DateTime.Now; model.UpdatedBy = Account.Employee.Email;
                model.Name = txtName.Text;
                model.SortOrder = int.Parse(txtNumOr.Text);
                model.Active = rdoStatus.Checked;
                model.Address = txtAddress.Text;
                model.PersonalManager = txtPersonalManager.Text;
                model.Phone = txtPhone.Text;
                model.Code = txtCode.Text;
                model.Tel = "";
                model.HotLine = txtHotLine.Text;
                model.Email = txtEmail.Text;
                model.IpNetwork = "";
                model.Fax = txtFax.Text;
                model.BrandType = ddlBrandType.SelectedValue;
                model.GoogleMap = txtGoogleMap.Text;
                model.IsDisplayWeb = rdoIsDisplayWeb.Checked;
                message = "Cập nhật chi nhánh thành công.";
            }
            dbConnect.SubmitChanges();
            flag = true;
        }
        catch{ }
        if (flag)
        {
            ClientAlerter.ShowAndGoto(message, "/prodraftadmin/congty/brand/list.aspx");
        }
        else
        {
            ClientAlerter.Show(this, "Lưu dữ liệu thất bại. Vui lòng kiểm tra lại");
        }
    }
}
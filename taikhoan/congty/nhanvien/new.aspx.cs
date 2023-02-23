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
            ddlCompany.DataSource = dbConnect.company_CompanyInfos.Where(n => n.Active == true).OrderBy(n=>n.SortOrder);
            ddlCompany.DataValueField = "Id";
            ddlCompany.DataTextField = "Name";
            ddlCompany.DataBind();
            ddlCompany.Items.Insert(0, new ListItem("--Chọn văn phòng--",""));
            //phong ban
            ddlDepartment.DataSource = dbConnect.company_Departments.Where(n => n.Active == true).OrderBy(n => n.SortOrder);
            ddlDepartment.DataValueField = "Id";
            ddlDepartment.DataTextField = "Name";
            ddlDepartment.DataBind();
            ddlDepartment.Items.Insert(0, new ListItem("--Chọn phòng ban--", ""));
            //vị trị
            ddlPosition.DataSource = dbConnect.company_Positions.Where(n => n.Active == true).OrderBy(n => n.SortOrder);
            ddlPosition.DataValueField = "Id";
            ddlPosition.DataTextField = "Name";
            ddlPosition.DataBind();
            ddlPosition.Items.Insert(0, new ListItem("--Chọn vị trí--", ""));
            if (Id != null)
            {
                var model = dbConnect.company_Employees.Single(n => n.Id == int.Parse(Id));
                txtId.Value = model.Id + "";
                txtFirstName.Text = model.FirstName;
                rdoStatus.Checked = model.Active.Value;
                txtNumOr.Text = model.SortOrder + "";
                txtEmail.Text = model.Email;
                txtBirthday.Text = model.Birthday.Value.ToString("dd/MM/yyyy");
                txtworkingDate.Text = model.workingDate.Value.ToString("dd/MM/yyyy");
                chkGender.Checked = model.Gender.Value;
                txtAddress.Text = model.Address;
                txtHomePhone.Text = model.HomePhone;
                txtMobile.Text = model.Mobile;
                txtCompanyTel.Text = model.CompanyTel;
                //txtImage.Value = model.Avatar;
                imgImage.ImageUrl = "/" + model.Avatar;
                if (model.company_EmployeeDetails.Count > 0)
                {
                    ddlCompany.SelectedValue = model.company_EmployeeDetails[0].CompanyInfoId + "";
                    ddlPosition.SelectedValue = model.company_EmployeeDetails[0].PositionId + "";
                    ddlDepartment.SelectedValue = model.company_EmployeeDetails[0].DepartmentId + "";
                }
                txtCode.Text = model.Code;
            }
            else
            {
                rdoStatus.Checked = true;
                txtBirthday.Text = DateTime.Now.ToString("dd/MM/yyyy");
                txtworkingDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                //txtImage.Value = "upload/nhanvien/no-avatar.png";
                txtNumOr.Text = (dbConnect.company_Employees.Count() + 1) + "";
                txtCode.Text = string.Format("{0:PI000000}", (dbConnect.company_Employees.Count() + 1));
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string urlImageFolder = "upload/nhan-vien/" + DateTime.Now.Year + "/" + DateTime.Now.Month.ToString("00");
        System.IO.Directory.CreateDirectory(Server.MapPath("~/" + urlImageFolder));
        bool flag = false;
        string message = "";
        try
        {
            if (txtId.Value == null || txtId.Value == "")
            {
                #region Create
                var model = new company_Employee()
                {
                    CreatedAt = DateTime.Now,
                    CreatedBy = Account.Employee.Email,
                    FirstName = txtFirstName.Text,
                    Active = rdoStatus.Checked,
                    SortOrder = int.Parse(txtNumOr.Text),
                    IsDeleted=false,
                    Address=txtAddress.Text,
                    Code=txtCode.Text,
                    //Avatar=txtImage.Value,
                    Birthday= DateTime.ParseExact(txtBirthday.Text, "dd/MM/yyyy", null),
                    CompanyTel=txtCompanyTel.Text,
                    Email=txtEmail.Text,
                    Gender=chkGender.Checked,
                    HomePhone=txtHomePhone.Text,
                    Mobile=txtMobile.Text,
                    workingDate= DateTime.ParseExact(txtworkingDate.Text, "dd/MM/yyyy", null)
                };
                if (fulImage.HasFile)
                {
                    string doihinh = fulImage.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "avatar-" + txtFirstName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    model.Avatar = ImgSub;
                }
                dbConnect.company_Employees.InsertOnSubmit(model);
                var employeeDetail = new company_EmployeeDetail()
                {
                    CompanyInfoId = int.Parse(ddlCompany.SelectedValue),
                    PositionId = int.Parse(ddlPosition.SelectedValue),
                    DepartmentId = int.Parse(ddlDepartment.SelectedValue),
                    company_Employee = model,
                    SortOrder = 1,
                    Active = true,
                    CreatedAt = DateTime.Now,
                    CreatedBy = Account.Employee.Email + "",
                };
                dbConnect.company_EmployeeDetails.InsertOnSubmit(employeeDetail);
                message = "Thêm mới nhân viên thành công.";
                #endregion
            }
            else
            {
                var model = dbConnect.company_Employees.Single(n => n.Id == int.Parse(txtId.Value));
                model.UpdatedAt = DateTime.Now; model.UpdatedBy = Account.Employee.Email;
                model.FirstName = txtFirstName.Text;
                model.SortOrder = int.Parse(txtNumOr.Text);
                model.Active = rdoStatus.Checked;
                model.Email = txtEmail.Text;
                model.Birthday = DateTime.ParseExact(txtBirthday.Text, "dd/MM/yyyy", null);
                model.Gender = chkGender.Checked;
                model.workingDate = DateTime.ParseExact(txtworkingDate.Text, "dd/MM/yyyy", null);
                model.HomePhone = txtHomePhone.Text;
                model.Mobile = txtMobile.Text;
                model.Address = txtAddress.Text;
                if (fulImage.HasFile)
                {
                    string doihinh = fulImage.FileName.Trim();
                    doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                    string hinh_web = "avatar-" + txtFirstName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                    fulImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                    string ImgSub = urlImageFolder + "/" + hinh_web;
                    model.Avatar = ImgSub;
                }
                model.CompanyTel = txtCompanyTel.Text;
                //update detail
                var detail = dbConnect.company_EmployeeDetails.Single(n => n.EmployeeId == model.Id);
                detail.UpdatedAt = DateTime.Now; detail.UpdatedBy = Account.Employee.Email;
                detail.CompanyInfoId = int.Parse(ddlCompany.SelectedValue);
                detail.PositionId = int.Parse(ddlPosition.SelectedValue);
                detail.DepartmentId = int.Parse(ddlDepartment.SelectedValue);
                message = "Cập nhật nhân viên thành công.";
            }
            dbConnect.SubmitChanges();
            flag = true;
        }
        catch {
        }
        if (flag)
        {
            ClientAlerter.ShowAndGoto(message, "/prodraftadmin/congty/nhanvien/list.aspx");
        }
        else
        {
            ClientAlerter.Show(this, "Lưu dữ liệu thất bại. Vui lòng kiểm tra lại");
        }
    }
}
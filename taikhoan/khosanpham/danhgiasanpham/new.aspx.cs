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
            ddlScore.Items.Add(new ListItem("5 sao", "5"));
            ddlScore.Items.Add(new ListItem("4 sao", "4"));
            ddlScore.Items.Add(new ListItem("3 sao", "3"));
            ddlScore.Items.Add(new ListItem("2 sao", "2"));
            ddlScore.Items.Add(new ListItem("1 sao", "1"));
            if (Id != null)
            {
                var model = dbConnect.pro_ProductComments.Single(n => n.Id == int.Parse(Request["Id"]));
                txtId.Value = model.Id + "";
                txtDescription.Value = model.company_EmployeeAnswer;
                txtName.Text = model.FullName;
                txtSummary.Value = model.Comment;
                rdoStatus.Checked = model.IsStatus.Value;
                ddlScore.SelectedValue = model.ScoreRate+"";
                txtEmail.Text = model.Email;
                txtPhone.Text = model.Phone;
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
                var model = new pro_ProductComment()
                {
                    CreatedAt = DateTime.Now,
                    CreatedBy = Account.Employee.Email,
                    IsDeleted = false,
                    pro_ProductId = int.Parse(Request["parent"]),
                    ScoreRate = int.Parse(ddlScore.SelectedValue),
                    Comment = txtSummary.Value,
                    company_EmployeeAnswer = txtDescription.Value,
                    FullName = txtName.Text,
                    Email = txtEmail.Text,
                    Phone = txtPhone.Text,
                    IsCustomer = false,
                    Address = "",
                    company_EmployeeId = Account.EmployeeAccount.Id,
                    Image = "",
                    IpRate = ip,
                    IsStatus = rdoStatus.Checked,
                    CreatedAnswerAt = DateTime.Now,
                    CreatedAnswerBy=Account.Employee.Email
                };
                dbConnect.pro_ProductComments.InsertOnSubmit(model);
                dbConnect.SubmitChanges();
                ClientAlerter.ShowAndGoto("Thêm đánh giá sản phẩm thành công", "/prodraftadmin/khosanpham/quanlysanpham/danhgia/list.aspx?parent=" + Request["parent"]);
            }
            else
            {
                var model = dbConnect.pro_ProductComments.Single(n => n.Id == int.Parse(Request["Id"]));
                model.IpRate = ip;
                model.Image = "";
                model.IsStatus = rdoStatus.Checked;
                model.Phone = txtPhone.Text;
                model.Address = "";
                model.Comment = txtSummary.Value;
                model.company_EmployeeAnswer = txtDescription.Value;
                model.company_EmployeeId = Account.EmployeeAccount.Id;
                //model.CreatedAnswerAt = DateTime.Now;
                //model.CreatedAnswerBy = Account.Employee.Email;
                model.Email = txtEmail.Text;
                model.FullName = txtName.Text;
                model.Image = "";
                model.IsCustomer = false;
                model.ScoreRate = int.Parse(ddlScore.SelectedValue);
                model.UpdatedAnswerAt = DateTime.Now;
                model.UpdatedAnswerBy = Account.Employee.Email;
                model.UpdatedAt = DateTime.Now;
                model.UpdatedBy = Account.Employee.Email;
                dbConnect.SubmitChanges();
                ClientAlerter.ShowAndGoto("Cập nhật đánh giá sản phẩm thành công", "/prodraftadmin/khosanpham/danhgiasanpham/list.aspx");
            }
        }
        catch (Exception ex) { ClientAlerter.Show(this, "Lưu dữ liệu thất bại. Vui lòng kiểm tra lại"); }
    }
    
}
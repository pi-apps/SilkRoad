using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database;
using DongAGroup.Helpers.Encrypt;

public partial class prodraftadmin_congty_nhanvien_EmployeeInfo : AdminPageUtils
{
    public pro_ProductPrice pro_ProductPrice { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        pro_ProductPrice = dbConnect.pro_ProductPrices.Single(n => n.Id == int.Parse(Request["Id"]));
        if (!IsPostBack)
        {
            
            ddlShowroom.DataSource = dbConnect.company_CompanyInfos.Where(n => n.Active == true && n.BrandType == "Showroom").OrderBy(n => n.SortOrder);
            ddlShowroom.DataValueField = "Id";
            ddlShowroom.DataTextField = "Name";
            ddlShowroom.DataBind();
            ddlShowroom.Items.Insert(0, new ListItem("--Chọn showroom--",""));
            LoadDanhMuc();
        }

    }
    void LoadDanhMuc()
    {
        rptDanhMuc.DataSource = dbConnect.pro_ProductCompanies.Where(n => n.pro_ProductPriceId == int.Parse(Request["Id"]));
        rptDanhMuc.DataBind();

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        var pro_ProductModel = dbConnect.pro_ProductPrices.Single(n => n.Id == int.Parse(Request["Id"]));
        lblMessage.Visible = true;
        try
        {
            if (hdfId.Value == "")//thêm mới
            {
                if (dbConnect.pro_ProductCompanies.Where(n =>n.pro_ProductPriceId==pro_ProductModel.Id&& n.company_CompanyInfoId == int.Parse(ddlShowroom.SelectedValue)).Count() == 0)
                {
                    var model = new pro_ProductCompany()
                    {
                        company_CompanyInfoId=int.Parse(ddlShowroom.SelectedValue),
                        CreatedAt=DateTime.Now,
                        CreatedBy=Account.Employee.Email,
                        IsStatus=true,NumOr=1,
                        pro_ProductPriceId= pro_ProductModel.Id,
                        Quantity=int.Parse(txtQuantity.Text)
                    };
                    dbConnect.pro_ProductCompanies.InsertOnSubmit(model);
                    dbConnect.SubmitChanges();
                    txtQuantity.Text = "";hdfId.Value = "";ddlShowroom.SelectedIndex = 0;
                    lblMessage.Text = "Lưu thông tin thành công.";
                }
                else
                {
                    lblMessage.Text = "Kho hàng này đã được tạo.";
                }
            }
            else//chỉnh sửa
            {
                var model = dbConnect.pro_ProductCompanies.Single(n => n.Id == int.Parse(hdfId.Value));
                model.Quantity = int.Parse(txtQuantity.Text);
                model.UpdatedAt = DateTime.Now;
                model.UpdatedBy = Account.Employee.Email;
                dbConnect.SubmitChanges();
                ddlShowroom.Enabled = true;
                txtQuantity.Text = ""; hdfId.Value = ""; ddlShowroom.SelectedIndex = 0;
                lblMessage.Text = "Lưu thông tin thành công.";
            }
            LoadDanhMuc();
        }
        catch
        {
            lblMessage.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại dữ liệu";
        }
    }

    protected void btnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_ProductCompany model = dbConnect.pro_ProductCompanies.Single(m => m.Id == int.Parse(l.CommandArgument));
        dbConnect.pro_ProductCompanies.DeleteOnSubmit(model);
        dbConnect.SubmitChanges();
        LoadDanhMuc();
        lblMessage.Text = "Xóa thành công";
    }

    protected void ImgEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_ProductCompany model = dbConnect.pro_ProductCompanies.Single(m => m.Id == int.Parse(l.CommandArgument));
        ddlShowroom.SelectedValue = model.company_CompanyInfoId.Value + "";
        txtQuantity.Text = model.Quantity + "";
        hdfId.Value = model.Id+"";
        ddlShowroom.Enabled = false;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ddlShowroom.Enabled = true;
        txtQuantity.Text = "";
        hdfId.Value = "";
        ddlShowroom.SelectedIndex = 0;
        lblMessage.Visible = false;
        lblMessage.Text = "";
    }
}
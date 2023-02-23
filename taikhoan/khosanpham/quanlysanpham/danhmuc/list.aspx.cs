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
    public pro_Product pro_Product { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        pro_Product = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"]));
        if (!IsPostBack)
        {
            ProductCategorysUtils.loadDropDownListEdit(ddlMenuParent);
            LoadDanhMuc();
        }

    }
    void LoadDanhMuc()
    {
        rptDanhMuc.DataSource = dbConnect.pro_ProductCategories.Where(n => n.pro_ProductId == int.Parse(Request["Id"]))
            .Select(n => new
            {
                n.Id,n.pro_Category.Name,
                Code=n.IsCode==null? "/prodraftadmin/images/hidden.gif" : n.IsCode==false?"/prodraftadmin/images/hidden.gif": "/prodraftadmin/images/visible.gif"
            })
            ;
        rptDanhMuc.DataBind();

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        var pro_ProductModel = dbConnect.pro_Products.Single(n => n.Id == int.Parse(Request["Id"]));
        lblMessage.Visible = true;
        try
        {
            if (dbConnect.pro_ProductCategories.Where(n => n.pro_CategoryId == int.Parse(ddlMenuParent.SelectedValue)&&n.pro_ProductId== int.Parse(Request["Id"])).Count() > 0)
            {
                lblMessage.Text = "Danh mục cho sản phẩm này đã tồn tại";
            }
            else
            {
                var proCate = new pro_ProductCategory()
                {
                    pro_CategoryId = int.Parse(ddlMenuParent.SelectedValue),
                    CreatedAt = DateTime.Now,
                    CreatedBy = Account.Employee.Email,
                    IsDeleted = false,
                    IsStatus = true,
                    IsCode=chkIsMa.Checked,
                    pro_ProductId = pro_ProductModel.Id
                };
                dbConnect.pro_ProductCategories.InsertOnSubmit(proCate);
                dbConnect.SubmitChanges();
                lblMessage.Text = "Thêm danh mục cho sản phẩm thành công";
                ddlMenuParent.SelectedIndex = -1;
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
        pro_ProductCategory model = dbConnect.pro_ProductCategories.Single(m => m.Id == int.Parse(l.CommandArgument));
        dbConnect.pro_ProductCategories.DeleteOnSubmit(model);
        dbConnect.SubmitChanges();
        LoadDanhMuc();
        lblMessage.Text = "Xóa danh mục sản phẩm thành công";
    }

    protected void imgDisplayCode_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton l = sender as ImageButton;
        pro_ProductCategory model = dbConnect.pro_ProductCategories.Single(m => m.Id == int.Parse(l.CommandArgument));
        model.IsCode = !model.IsCode;
        model.UpdatedAt = DateTime.Now;
        model.UpdatedBy = Account.Employee.Email;
        dbConnect.SubmitChanges();
        LoadDanhMuc();
        lblMessage.Text = "Cập nhật danh mục sản phẩm thành công";
    }
}
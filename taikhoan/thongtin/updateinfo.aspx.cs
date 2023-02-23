using Database;
using dxtLib.WebProvider;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Siteadmin_cauhinh_banner_new : PrivateUser
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var model = dbConnect.store_Customers.Single(n => n.Id == Account.Id);
            txtId.Value = model.Id + "";
            txtPresenterCode.Text = model.Code;
            txtCode.Text = model.Code;
            txtEmail.Text = model.Email;
            txtFullName.Text = model.FullName;
            txtPhone.Text = model.Phone;
            txtAddress.Text = model.Address;
            txtPiWallet.Text = model.PiWallet;
            txtCMNDNumber.Text = model.CMNDNumber;
            txtPlaceOfIssue.Text = model.PlaceOfIssue;
            try { txtDateOfIssue.Text = model.DateOfIssue.Value.ToString("dd/MM/yyyy"); } catch { }
            if (File.Exists(MapPath("~/"+ model.Avatar)))
            {
                imgImage.ImageUrl = "/" + model.Avatar;
            }
            else
            {
                imgImage.ImageUrl = "/user_upload/no-avatar.png";
            }
            if (File.Exists(MapPath("~/" + model.CMNDAfter)))
            {
                imgCMNDMS.ImageUrl = "/" + model.CMNDAfter;
            }
            else
            {
                imgCMNDMS.ImageUrl = "/user_upload/no-avatar.png";
            }
            if (File.Exists(MapPath("~/" + model.CMNDBefore)))
            {
                imgCMNDMT.ImageUrl = "/" + model.CMNDBefore;
            }
            else
            {
                imgCMNDMT.ImageUrl = "/user_upload/no-avatar.png";
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string urlImageFolder = "user_upload/thong-tin-ca-nhan/" + DateTime.Now.Year + "/" + DateTime.Now.Month.ToString("00");
        System.IO.Directory.CreateDirectory(Server.MapPath("~/" + urlImageFolder));
        try
        {
            var model = dbConnect.store_Customers.Single(n => n.Id == Account.Id);
            model.UpdatedAt = DateTime.Now; model.UpdatedBy = Account.Email;
            model.PiWallet = txtPiWallet.Text;
            model.FullName = txtFullName.Text;
            model.Address = txtAddress.Text;
            model.CMNDNumber = txtCMNDNumber.Text;
            model.PlaceOfIssue = txtPlaceOfIssue.Text;
            try { model.DateOfIssue = DateTime.ParseExact(txtDateOfIssue.Text, "dd/MM/yyyy", null); } catch { }
            try { model.Phone = txtPhone.Text; } catch { }
            if (fulImage.HasFile)
            {
                string doihinh = fulImage.FileName.Trim();
                doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                string hinh_web = "avatar-" + txtFullName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                fulImage.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                string ImgSub = urlImageFolder + "/" + hinh_web;
                model.Avatar = ImgSub;
            }
            if (fulCMNDMT.HasFile)
            {
                string doihinh = fulCMNDMT.FileName.Trim();
                doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                string hinh_web = "cmndmt-" + txtFullName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                fulCMNDMT.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                string ImgSub = urlImageFolder + "/" + hinh_web;
                model.CMNDBefore = ImgSub;
            }
            if (fulCMNDMS.HasFile)
            {
                string doihinh = fulCMNDMS.FileName.Trim();
                doihinh = doihinh.Substring(doihinh.LastIndexOf('.'));
                string hinh_web = "cmndms-" + txtFullName.Text.Trim().ToLower().RemoveSymbol().ToLower() + ("-" + DateTime.Now.Ticks) + doihinh;
                fulCMNDMS.SaveAs(Server.MapPath("~/" + urlImageFolder + "/" + hinh_web));
                string ImgSub = urlImageFolder + "/" + hinh_web;
                model.CMNDAfter = ImgSub;
            }
            dbConnect.SubmitChanges();
            SecurityPublicUtils utils = new SecurityPublicUtils();
            utils.Login(model.Email, EncryptPassword.Decrypt(model.Password), true);
            ClientAlerter.ShowAndGoto("Lưu dữ liệu thành công", "/taikhoan/thongtin/updateinfo.aspx");
        }
        catch{ ClientAlerter.Show(this, "Lưu dữ liệu thất bại. Vui lòng kiểm tra lại"); }

    }
}
using Database;
using Piglobal.Data.Mail;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class member_Default : PublicUser
{
    public other_Webpage seo { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        seo = dbConnect.other_Webpages.Single(n => n.Id == 59);
        if (!IsPostBack)
        {
            seo.ViewCount += 1;
            try { dbConnect.SubmitChanges(); } catch { }
            Session["PiglobalUser"] = null;
            Session.Abandon();
            CookiesUtils cookies = new CookiesUtils();
            cookies.Remove("PiglobalUser");
        }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        CodeSystemUtil codeSystemUtil = new CodeSystemUtil();
        try
        {
            //check email exist
            var customerIsExist = dbConnect.store_Customers.Where(n => n.Email == txtEmail.Text);
            bool flag = false;
            if (customerIsExist.Count()>0)
            {
                lblErrorEmail.Text = "Email đăng ký đã tồn tại. Vui lòng chọn email khác";
                flag = false;
            }
            else
            {
                customerIsExist = dbConnect.store_Customers.Where(n => n.Phone == txtPhone.Text);
                if (customerIsExist.Count() > 0)
                {
                    lblErrorPhone.Text = "Điện thoại đăng ký đã tồn tại. Vui lòng chọn số điện thoại khác";
                    flag = false;
                }
                else
                {
                    flag = true;
                }
            }
            if (flag == true)
            {
                string code = GenerateKeyUtil.GenerateKey();
                var store_PiGift = dbConnect.store_PiGifts.First();
                store_Customer member = new store_Customer()
                {
                    Code = codeSystemUtil.CustomerCode(),
                    CodeVerify = code,
                    PresenterCode="",
                    Address = "",
                    Avatar = "user_upload/no-avatar.png",
                    Birthday = DateTime.Now,
                    CreatedAt = DateTime.Now,
                    CreatedBy = txtEmail.Text,
                    Email = txtEmail.Text,
                    FullName = txtFullName.Text,
                    Gender = false,
                    IsStatus = true,
                    AmountBalance = 0,
                    Phone = txtPhone.Text,
                    IsActive = false,
                    Password = EncryptPassword.Encrypt(txtPassword.Text),
                    IsCooperate = false,
                    IsVerifyEmail = false,
                    IsVerifyPhone = false,
                    IsDeleted = false,
                    //PiWallet=txtPiWallet.Text,
                    CMNDAfter = "user_upload/no-avatar.png",
                    CMNDBefore = "user_upload/no-avatar.png",
                    CMNDNumber = ""
                };
                if (store_PiGift.Amount - 0.1 >= 0)
                {
                    member.AmountBalance = 0.1;
                    store_PiGift.Amount -= 0.1;
                    store_PiGift.UpdatedBy = member.Email;
                    store_PiGift.UpdatedAt = DateTime.Now;
                }
                dbConnect.store_Customers.InsertOnSubmit(member);
                var store_CustomerTransactionHistory = new store_CustomerTransactionHistory()
                {
                    Amount = 0.1,
                    AdminConfirmDate = DateTime.Now,
                    AttachedFile = "",
                    Code = codeSystemUtil.TransactionCode(),
                    CreatedAt = DateTime.Now,
                    CreatedBy = member.Email,
                    IsAdminConfirm = true,
                    IsDeleted = false,
                    IsUserConfirm = true,
                    Note = "",IsAuction=false,
                    store_Customer = member,
                    store_PiGiftId = 1,
                    store_TransactionTypeId = 3,
                    UserConfirmDate = DateTime.Now
                };
                dbConnect.store_CustomerTransactionHistories.InsertOnSubmit(store_CustomerTransactionHistory);
                var sys_HistoryWallet = new sys_HistoryWallet()
                {
                    Note = "",
                    IsDeleted = false,IsAuction=false,
                    Amount = -0.1,
                    AttachedFile = "",
                    Code = store_CustomerTransactionHistory.Code,
                    store_Customer = member,
                    store_TransactionTypeId = 3,
                    sys_TotalWalletId = 1,
                    CreatedAt = DateTime.Now,
                    CreatedBy = member.Email
                };
                dbConnect.sys_HistoryWallets.InsertOnSubmit(sys_HistoryWallet);
                //var sys_TotalWallet = dbConnect.sys_TotalWallets.Single(n => n.Id == 1);
                //sys_TotalWallet.Amount += sys_HistoryWallet.Amount;
                //sys_TotalWallet.UpdatedAt = DateTime.Now;
                //sys_TotalWallet.UpdatedBy = member.Email;
                dbConnect.SubmitChanges();
                #region Cập nhật người giới thiệu
                try
                {
                    //lay user giới thiệu
                    var cusPresenter = dbConnect.store_Customers.SingleOrDefault(n => n.Code == txtPresenterCode.Text);
                    if (cusPresenter != null)
                    {
                        cusPresenter.AmountBalance += 0.1;
                        cusPresenter.UpdatedAt = DateTime.Now;
                        cusPresenter.UpdatedBy = member.Email;
                        member.PresenterCode = txtPresenterCode.Text;
                        var store_CustomerTransactionPresenterHistory = new store_CustomerTransactionHistory()
                        {
                            Amount = 0.1,
                            AdminConfirmDate = DateTime.Now,
                            AttachedFile = "",
                            Code = codeSystemUtil.TransactionCode(),
                            CreatedAt = DateTime.Now,
                            CreatedBy = member.Email,
                            IsAdminConfirm = true,IsAuction=false,
                            IsDeleted = false,
                            IsUserConfirm = true,
                            Note = "",
                            store_CustomerId = cusPresenter.Id,
                            store_TransactionTypeId = 11,
                            UserConfirmDate = DateTime.Now
                        };
                        dbConnect.store_CustomerTransactionHistories.InsertOnSubmit(store_CustomerTransactionPresenterHistory);
                        var sys_HistoryPresenterWallet = new sys_HistoryWallet()
                        {
                            Note = "",
                            IsDeleted = false,IsAuction=false,
                            Amount = -0.1,
                            AttachedFile = "",
                            Code = store_CustomerTransactionPresenterHistory.Code,
                            store_Customer = member,
                            store_TransactionTypeId = 11,
                            CreatedAt = DateTime.Now,
                            CreatedBy = member.Email
                        };
                        dbConnect.sys_HistoryWallets.InsertOnSubmit(sys_HistoryPresenterWallet);
                        dbConnect.SubmitChanges();
                    }
                } catch { }
                #endregion
                Session["signup"] = "success";
                //send email confirm
                #region send email confirm
                try
                {

                    string LogoEmail = ConfigurationManager.AppSettings["LogoEmail"].ToString();
                    string url = urlDomain + "member/confirm.aspx?code=" + code;
                    StreamReader red = new StreamReader(MapPath("~/email_template/signup.html"));
                    string body = red.ReadToEnd();
                    red.Close();
                    body = string.Format(body, url, LogoEmail);
                    //send user
                    PiglobalEmail.SendEmail(txtEmail.Text, "[piglobal.net] Xác nhận kích hoạt tài khoản", body);
                    //SeoGMail.Send(txtEmail.Text, "[piglobal.net] Xác nhận kích hoạt tài khoản", body);
                    string emmails = ConfigurationManager.AppSettings["emailNotification"].ToString();
                    Thread tSendMails;
                    tSendMails = new System.Threading.Thread(delegate ()
                    {
                        foreach (var email in emmails.Split(','))
                        {
                            //SeoGMail.Send(email, "[piglobal.net] Thành viên mới đăng ký", "Tài khoản : " + member.Email + " - " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss"));
                            PiglobalEmail.SendEmail(email, "[piglobal.net] Thành viên mới đăng ký", "Tài khoản : " + member.Email + " - " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss"));
                        }
                    });
                    tSendMails.IsBackground = true;
                    tSendMails.Start();
                }
                catch { }
                //catch(Exception ex) { Response.Write(ex.ToString()); }
                #endregion
                txtEmail.Text =lblErrorEmail.Text=lblErrorPhone.Text = txtPassword.Text = txtRePassword.Text = txtPhone.Text = txtFullName.Text = "";
                Response.Redirect("/member/dang-ky.aspx");
            }
            else
            {
                //lblErrorEmail.Text = "Có lỗi xảy ra. Bạn vui lòng ";
            }
        }
        catch(Exception ex)
        {
            //Response.Write(ex.ToString());
            //lblErrorEmail.Text = "Email đăng ký đã tồn tại. Vui lòng chọn một email khác.";
        }
    }

    //protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    var customer = dbConnect.store_Customers.Where(n => n.Email == args.Value);
    //    if(customer.Count()>0) args.IsValid = true;
    //    else args.IsValid = false;
    //}

    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        var customer = dbConnect.store_Customers.Where(n => n.Phone == args.Value);
        if (customer.Count() > 0) args.IsValid = true;
        else args.IsValid = false;
    }

    //protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    var customer = dbConnect.store_Customers.Where(n => n.PiWallet == args.Value);
    //    if (customer.Count() > 0) args.IsValid = true;
    //    else args.IsValid = false;
    //}
}
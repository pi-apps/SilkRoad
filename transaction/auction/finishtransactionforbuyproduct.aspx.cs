using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database;
public partial class transaction_CreateTransactionBuyProduct : PrivateUser
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CodeSystemUtil codeSystemUtil = new CodeSystemUtil();
        //lay thông tin cần thiết
        var order = dbConnect.order_Orders.Single(n => n.Id == int.Parse(Request["order"]));
        var customerSeller = dbConnect.store_Customers.Single(n => n.Id == order.SellerId);
        order.IsBuyerConfirm = true;
        order.BuyerConfirmDate = DateTime.Now;
        order.DeletedAt = DateTime.Now;
        order.DeletedBy = Account.Email;
        //tra lai tien coc
        var historyAuction = dbConnect.pro_HistoryProductAuctions
            .Where(n => n.pro_ProductId == order.pro_ProductId)
            .Where(n => n.store_CustomerId == order.BuyerId);
        foreach (var cus in historyAuction)
        {
            var lostCustomer = dbConnect.store_Customers.Single(n => n.Id == cus.store_CustomerId);
            cus.IsReturn = true;
            cus.UpdatedAt = DateTime.Now;
            cus.UpdatedBy = Account.Email;

            lostCustomer.UpdatedAt = DateTime.Now;
            lostCustomer.UpdatedBy = Account.Email;
            lostCustomer.AmountBalance += cus.PriceAuctionOld;
            //tao giao dịch hoàn tiền
            //giữ lại tiền của tài khoản người mua và người bán
            var store_CustomerTransactionHistory = new store_CustomerTransactionHistory()
            {
                pro_ProductId = cus.pro_ProductId,
                Amount = cus.PriceAuctionOld,
                AdminConfirmDate = DateTime.Now,
                AttachedFile = "",
                Code = codeSystemUtil.TransactionCode(),
                CreatedAt = DateTime.Now,
                CreatedBy = Account.Email,
                IsAdminConfirm = true,
                IsDeleted = false,
                IsUserConfirm = true,
                Note = "",
                IsAuction = true,
                store_CustomerId = lostCustomer.Id,
                store_PiGiftId = 1,
                store_TransactionTypeId = 9,
                UserConfirmDate = DateTime.Now
            };
            dbConnect.store_CustomerTransactionHistories.InsertOnSubmit(store_CustomerTransactionHistory);
            var sys_HistoryWallet = new sys_HistoryWallet()
            {
                Note = "",
                pro_ProductId = cus.pro_ProductId,
                IsAuction = true,
                IsDeleted = false,
                Amount = -cus.PriceAuctionOld,
                AttachedFile = "",
                Code = store_CustomerTransactionHistory.Code,
                store_CustomerId = lostCustomer.Id,
                store_TransactionTypeId = 9,
                sys_TotalWalletId = 1,
                CreatedAt = DateTime.Now,
                CreatedBy = Account.Email
            };
            dbConnect.sys_HistoryWallets.InsertOnSubmit(sys_HistoryWallet);
        }
        //tra lại tiền cho người bán hàng
        //giữ lại tiền của tài khoản người mua và người bán
        var store_CustomerTransactionHistoryReturn = dbConnect.store_CustomerTransactionHistories
            .Where(m => m.store_CustomerId == customerSeller.Id && m.pro_ProductId == order.Id && m.store_TransactionTypeId == 10);
        foreach (var item in store_CustomerTransactionHistoryReturn)
        {
            customerSeller.AmountBalance += item.Amount;
            customerSeller.DeletedAt = DateTime.Now;
            customerSeller.DeletedBy = Account.Email;
            var store_CustomerTransactionHistory = new store_CustomerTransactionHistory()
            {
                pro_ProductId = item.pro_ProductId,
                Amount = item.Amount,
                AdminConfirmDate = DateTime.Now,
                AttachedFile = "",
                Code = codeSystemUtil.TransactionCode(),
                CreatedAt = DateTime.Now,
                CreatedBy = Account.Email,
                IsAdminConfirm = true,
                IsDeleted = false,
                IsUserConfirm = true,
                Note = "",
                IsAuction = true,
                store_CustomerId = customerSeller.Id,
                store_PiGiftId = 1,
                store_TransactionTypeId = 9,
                UserConfirmDate = DateTime.Now
            };
            dbConnect.store_CustomerTransactionHistories.InsertOnSubmit(store_CustomerTransactionHistory);
            var sys_HistoryWallet = new sys_HistoryWallet()
            {
                Note = "",
                pro_ProductId = item.pro_ProductId,
                IsAuction = true,
                IsDeleted = false,
                Amount = -item.Amount,
                AttachedFile = "",
                Code = store_CustomerTransactionHistory.Code,
                store_CustomerId = customerSeller.Id,
                store_TransactionTypeId = 9,
                sys_TotalWalletId = 1,
                CreatedAt = DateTime.Now,
                CreatedBy = Account.Email
            };
            dbConnect.sys_HistoryWallets.InsertOnSubmit(sys_HistoryWallet);
        }
        
        dbConnect.SubmitChanges();
    }
}
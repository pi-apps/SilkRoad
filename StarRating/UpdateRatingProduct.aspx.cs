using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Database;
public partial class StarRating_UpdateRatingProduct : PrivateUser
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try {
            int idProduct = int.Parse(Request["idProduct"]);
            double value = double.Parse(Request["value"]);
            var product = dbConnect.pro_Products.Single(n => n.Id == idProduct);
            var store_ShopRanking = new store_ShopRanking()
            {
                IsDeleted = false,
                pro_ProductId = idProduct,
                Score = value,
                store_CustomerId = Account.Id,
                store_ShopRentalId = product.store_ShopRentalId,
                CreatedAt = DateTime.Now,
                CreatedBy = Account.Email
            };
            dbConnect.store_ShopRankings.InsertOnSubmit(store_ShopRanking);
            dbConnect.SubmitChanges();
            //cập nhật đánh giá shop
            var lstStoreShopRanking = dbConnect.store_ShopRankings
            .Where(n => n.store_ShopRentalId == product.store_ShopRentalId);
            var shopRental = dbConnect.store_ShopRentals.Single(n => n.Id == product.store_ShopRentalId);
            double score = 0.0;
            if (lstStoreShopRanking.Count() > 0)
            {
                score = (double)lstStoreShopRanking.Sum(n => n.Score).Value / (double)lstStoreShopRanking.Count();
            }
            shopRental.UpdatedAt = DateTime.Now;
            shopRental.UpdatedBy = Account.Email;
            shopRental.RankingCount = score;
            dbConnect.SubmitChanges();
        }
        catch { }
    }
}
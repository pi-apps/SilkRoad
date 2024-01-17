using System;
using System.Net.Http;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace PaymentA2U
{
    public class PaymentGateway
    {
        private const string A2U_API_URL = "https://api.a2u.com/v1/payments";

        private readonly string _apiToken;

        public PaymentGateway(string apiToken)
        {
            _apiToken = apiToken;
        }

        public void ProcessPayment(decimal amount, string currency, string cardNumber, string cardHolderName, int expirationMonth, int expirationYear, string cvv)
        {
            var request = new Dictionary<string, string>
            {
                { "amount", amount.ToString() },
                { "currency", currency },
                { "card_number", cardNumber },
                { "card_holder_name", cardHolderName },
                { "expiration_month", expirationMonth.ToString() },
                { "expiration_year", expirationYear.ToString() },
                { "cvv", cvv }
            };

            var httpClient = new HttpClient();

            httpClient.DefaultRequestHeaders.Add("Authorization", $"Bearer {_apiToken}");

            var response = httpClient.PostAsync(A2U_API_URL, new FormUrlEncodedContent(request)).Result;

            var content = response.Content.ReadAsStringAsync().Result;

            var paymentResponse = JsonConvert.DeserializeObject<PaymentResponse>(content);

            if (paymentResponse.Status == "success")
            {
                Console.WriteLine("Payment processed successfully");
            }
            else
            {
                Console.WriteLine($"Payment failed with message: {paymentResponse.Message}");
            }
        }
    }

    public class PaymentResponse
    {
        public string Status { get; set; }
        public string Message { get; set; }
    }
}

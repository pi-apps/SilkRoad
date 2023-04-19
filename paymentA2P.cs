using System;
using System.Net;
using System.Text;
using System.IO;
using System.Security.Cryptography;

namespace A2PPaymentSystem
{
    class Program
    {
        static void Main(string[] args)
        {
            // Define your API endpoint and API credentials
            string apiEndpoint = "https://yourapiendpoint.com/payments";
            string apiKey = "yourapikey";
            string apiSecret = "yourapisecret";
            
            // Define your payment parameters
            string amount = "10.00";
            string currency = "USD";
            string description = "Test Payment";
            
            // Generate a unique nonce
            string nonce = Guid.NewGuid().ToString();
            
            // Generate a timestamp
            string timestamp = DateTime.UtcNow.ToString("yyyy-MM-ddTHH:mm:ssZ");
            
            // Generate a signature
            string signatureData = $"{apiKey}{nonce}{timestamp}{amount}{currency}{description}";
            string signature = ComputeHmacSha256Hash(signatureData, apiSecret);
            
            // Construct the payment request
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(apiEndpoint);
            request.Method = "POST";
            request.ContentType = "application/json";
            request.Headers.Add("X-API-Key", apiKey);
            request.Headers.Add("X-API-Nonce", nonce);
            request.Headers.Add("X-API-Timestamp", timestamp);
            request.Headers.Add("X-API-Signature", signature);
            
            // Send the payment request
            string requestBody = $"{{\"amount\":\"{amount}\",\"currency\":\"{currency}\",\"description\":\"{description}\"}}";
            byte[] requestBodyBytes = Encoding.UTF8.GetBytes(requestBody);
            request.ContentLength = requestBodyBytes.Length;
            using (Stream requestBodyStream = request.GetRequestStream())
            {
                requestBodyStream.Write(requestBodyBytes, 0, requestBodyBytes.Length);
            }
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            using (StreamReader responseReader = new StreamReader(response.GetResponseStream()))
            {
                string responseText = responseReader.ReadToEnd();
                Console.WriteLine(responseText);
            }
        }
        
        static string ComputeHmacSha256Hash(string data, string key)
        {
            byte[] keyBytes = Encoding.UTF8.GetBytes(key);
            byte[] dataBytes = Encoding.UTF8.GetBytes(data);
            using (HMACSHA256 hmac = new HMACSHA256(keyBytes))
            {
                byte[] hashBytes = hmac.ComputeHash(dataBytes);
                return Convert.ToBase64String(hashBytes);
            }
        }
    }
}

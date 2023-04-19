using System;

namespace PaymentA2UCodeSystem
{
    class Program
    {
        static void Main(string[] args)
        {
            // Get payment amount from user
            Console.WriteLine("Enter payment amount:");
            decimal paymentAmount = Convert.ToDecimal(Console.ReadLine());

            // Generate A2U code based on payment amount
            string a2uCode = GenerateA2UCode(paymentAmount);

            // Display A2U code to user
            Console.WriteLine("Your A2U code is: " + a2uCode);

            // Wait for user to press a key before exiting
            Console.ReadKey();
        }

        static string GenerateA2UCode(decimal paymentAmount)
        {
            // Generate random 8-digit number as transaction ID
            Random rnd = new Random();
            int transactionId = rnd.Next(10000000, 99999999);

            // Concatenate transaction ID and payment amount
            string concatenatedString = transactionId.ToString() + paymentAmount.ToString();

            // Calculate checksum using Luhn algorithm
            int sum = 0;
            bool alternate = false;
            for (int i = concatenatedString.Length - 1; i >= 0; i--)
            {
                int n = int.Parse(concatenatedString.Substring(i, 1));
                if (alternate)
                {
                    n *= 2;
                    if (n > 9)
                        n = (n % 10) + 1;
                }
                sum += n;
                alternate = !alternate;
            }
            int checksum = (10 - (sum % 10)) % 10;

            // Generate A2U code by concatenating transaction ID, payment amount, and checksum
            string a2uCode = transactionId.ToString() + paymentAmount.ToString("F2") + checksum.ToString();

            return a2uCode;
        }
    }
}

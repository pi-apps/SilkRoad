import random
import re
import string


def convert_currency(amount, source_currency, target_currency):
    """Converts the given amount from the source currency to the target currency."""
    # Define the exchange rates
    exchange_rates = {"USD": 1.0, "EUR": 0.85, "GBP": 0.75, "JPY": 110.0, "CNY": 6.5}

    # Convert the source and target currencies to uppercase
    source_currency = source_currency.upper()
    target_currency = target_currency.upper()

    # Check if the source and target currencies are valid
    if source_currency not in exchange_rates or target_currency not in exchange_rates:
        raise ValueError("Invalid currency")

    # Convert the amount to the target currency
    converted_amount = amount * (
        exchange_rates[target_currency] / exchange_rates[source_currency]
    )

    # Return the converted amount
    return converted_amount


def validate_email(email):
    """Validates the given email address."""
    # Define the email pattern
    email_pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"

    # Check if the email address matches the pattern
    if re.match(email_pattern, email):
        return True
    else:
        return False


def generate_random_string(length):
    """Generates a random string of the given length."""
    # Define the characters to use for generating the random string
    characters = string.ascii_letters + string.digits + string.punctuation

    # Generate the random string
    random_string = "".join(random.choice(characters) for i in range(length))

    # Return the random string
    return random_string


# Example usage
amount = 100
source_currency = "USD"
target_currency = "EUR"
converted_amount = convert_currency(amount, source_currency, target_currency)
print(f"Converted amount: {converted_amount}")

email = "test@example.com"
if validate_email(email):
    print("Valid email")
else:
    print("Invalid email")

length = 10
random_string = generate_random_string(length)
print(f"Random string: {random_string}")

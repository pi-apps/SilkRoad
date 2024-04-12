import os
import base64
import hashlib
import hmac
import json
from cryptography.fernet import Fernet

def encrypt_data(data):
    """Encrypts the given data using a symmetric encryption algorithm."""
    # Generate a new encryption key
    key = Fernet.generate_key()

    # Create a new Fernet instance with the key
    f = Fernet(key)

    # Encrypt the data using the Fernet instance
    encrypted_data = f.encrypt(data.encode())

    # Return the encrypted data and the key
    return encrypted_data, key

def decrypt_data(encrypted_data, key):
    """Decrypts the given encrypted data using the given key."""
    # Create a new Fernet instance with the key
    f = Fernet(key)

    # Decrypt the data using the Fernet instance
decrypted_data = f.decrypt(encrypted_data)

    # Return the decrypted data
    return decrypted_data.decode()

def hash_password(password):
    """Hashes the given password using a hashing algorithm."""
    # Hash the password using SHA256
    hashed_password = hashlib.sha256(password.encode()).hexdigest()

    # Return the hashed password
    return hashed_password

def check_password(password, hashed_password):
    """Checks if the given password matches the hashed password."""
    # Hash the given password
    test_password = hash_password(password)

    # Compare the hashed password with the given password
    if test_password == hashed_password:
        # The passwords match
        return True

    # The passwords do not match
    return False

def generate_hmac(data, secret_key):
    """Generates an HMAC hash of the given data using the given secret key."""
    # Create an HMAC hash object
    h = hmac.new(secret_key.encode(), data.encode(), hashlib.sha256)

    # Generate the HMAC hash
    hmac_hash = h.digest()

    # Return the HMAC hash
    return hmac_hash

def verify_hmac(data, hmac_hash, secret_key):
    """Verifies if the given HMAC hash matches the given data using the given secret key."""
    # Generate the HMAC hash of the given data
    generated_hmac = generate_hmac(data, secret_key)

    # Compare the given HMAC hash with the generated HMAC hash
    if generated_hmac == hmac_hash:
        # The HMAC hashes match
        return True

    # The HMAC hashes do not match
    return False

def monitor_activity(logs):
    """Monitors user activity logs for suspicious activity."""
    # Define a list of suspicious activity patterns
    suspicious_patterns = [
        "deleted_multiple_records",
        "accessed_sensitive_data",
        "modified_critical_settings"
    ]

    # Analyze the logs for suspicious activity
    for log in logs:
        for pattern in suspicious_patterns:
            if pattern in log:
                # A suspicious binomial proportion test
                p = sum(1 for l in logs if pattern in l) / len(logs)
                z = stats.binom_test(k=1, n=len(logs), p=p, alternative="greater")

                # Check if the binomial proportion is statistically significant
                if z < 0.05:
                    # Flag the suspicious activity
                    print(f"Suspicious activity detected in log {log}")

                break

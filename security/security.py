# security.py
import hashlib
import hmac
from silkroad.models import User

class Security:
    def __init__(self, user_id):
        self.user_id = user_id
        self.user = User.objects.get(id=user_id)

    def generate_2fa_code(self):
        secret_key = self.user.two_factor_secret
        timestamp = int(time.time() / 30)
        code = hmac.new(secret_key.encode(), timestamp.to_bytes(8, 'big'), hashlib.sha1).hexdigest()[:6]
        return code

    def verify_2fa_code(self, code):
        secret_key = self.user.two_factor_secret
        timestamp = int(time.time() / 30)
        expected_code = hmac.new(secret_key.encode(), timestamp.to_bytes(8, 'big'), hashlib.sha1).hexdigest()[:6]
        return hmac.compare_digest(code, expected_code)

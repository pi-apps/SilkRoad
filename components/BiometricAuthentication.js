import { useState, useEffect } from 'eact';
import { useBiometricAuth } from '@silkroad/biometric-auth';

const BiometricAuthentication = () => {
  const [biometricAuth, setBiometricAuth] = useState(null);
  const [authenticated, setAuthenticated] = useState(false);

  useEffect(() => {
    const biometricAuthInstance = useBiometricAuth();
    setBiometricAuth(biometricAuthInstance);
  }, []);

  const handleAuthenticate = async () => {
    if (biometricAuth) {
      const result = await biometricAuth.authenticate();
      setAuthenticated(result);
    }
  };

  return (
    <div>
      <h2>Biometric Authentication</h2>
      <button onClick={handleAuthenticate}>Authenticate</button>
      {authenticated && <p>Authenticated successfully!</p>}
    </div>
  );
};

export default BiometricAuthentication;

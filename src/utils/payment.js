import { processPayment } from './payment';

const Payment = () => {
  const handlePayment = async () => {
    const from = 'your-pi-coin-wallet-address';
    const to = 'recipient-pi-coin-wallet-address';
    const amount = 10; // Pi Coins

    try {
      const result = await processPayment(from, to, amount);
      if (result) {
        console.log('Payment successful!');
      } else {
        console.log('Insufficient balance!');
      }
    } catch (error) {
      console.error('Payment failed:', error);
    }
  };

  return (
    <div>
      <button onClick={handlePayment}>Make Payment</button>
    </div>
  );
};

export default Payment;

import { getBalance, sendTransaction } from './pi-coin-api';

export async function processPayment(from, to, amount) {
  const balance = await getBalance(from);
  if (balance >= amount) {
    await sendTransaction(from, to, amount);
    return true;
  } else {
    return false;
  }
}

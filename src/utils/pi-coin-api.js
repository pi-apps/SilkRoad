import axios from 'axios';

const apiEndpoint = 'https://api.pi-coin.com/v1';

export async function getBalance(address) {
  const response = await axios.get(`${apiEndpoint}/balance/${address}`);
  return response.data;
}

export async function sendTransaction(from, to, amount) {
  const response = await axios.post(`${apiEndpoint}/transaction`, {
    from,
    to,
    amount,
  });
  return response.data;
}

import provider from './walletconnect';

document.getElementById('wallet-connect-btn').addEventListener('click', () => {
  provider.connect().then((accounts) => {
    console.log(accounts);
    // Update the UI to show the connected wallet
  });
});

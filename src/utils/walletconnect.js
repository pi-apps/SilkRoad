import Web3Provider from '@walletconnect/web3-provider';

const provider = new Web3Provider({
  chainId: 'eip155-20231',
  rpcUrl: 'http://rpc.tst.uled.io:8545',
  bridge: 'https://bridge.walletconnect.org',
  clientId: 'your-client-id',
});

export default provider;

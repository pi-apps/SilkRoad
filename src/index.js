import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import { provider } from './utils/walletconnect';
import WalletConnectLogic from './components/WalletConnectLogic';

ReactDOM.render(
  <React.StrictMode>
    <WalletConnectLogic provider={provider}>
      <App />
    </WalletConnectLogic>
  </React.StrictMode>,
  document.getElementById('root')
);

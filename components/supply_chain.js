// supply_chain.js
const Web3 = require('web3');
const web3 = new Web3(new Web3.providers.HttpProvider('https://mainnet.infura.io/v3/YOUR_PROJECT_ID'));

class SupplyChain {
    constructor(contractAddress) {
        this.contract = new web3.eth.Contract([
            {
                "constant": true,
                "inputs": [],
                "name": "getProductCount",
                "outputs": [{"name": "", "type": "uint256"}],
                "payable": false,
                "stateMutability": "view",
                "type": "function"
            },
            {
                "constant": false,
                "inputs": [{"name": "_productId", "type": "uint256"}],
                "name": "addProduct",
                "outputs": [],
                "payable": false,
                "stateMutability": "nonpayable",
                "type": "function"
            }
        ], contractAddress);
    }

    async addProduct(productId) {
        const accounts = await web3.eth.getAccounts();
        const txCount = await web3.eth.getTransactionCount(accounts[0]);
        const tx = {
            from: accounts[0],
            to: this.contract.options.address,
            value: '0',
            gas: '20000',
            gasPrice: web3.utils.toWei('20', 'gwei'),
            nonce: txCount,
            data: this.contract.methods.addProduct(productId).encodeABI()
        };
        const signedTx = await web3.eth.accounts.signTransaction(tx, '0xYOUR_PRIVATE_KEY');
        const receipt = await web3.eth.sendSignedTransaction(signedTx.rawTransaction);
        return receipt;
    }

    async getProductCount() {
        const result = await this.contract.methods.getProductCount().call();
        return result;
    }
}

const supplyChain = new SupplyChain('0xYOUR_CONTRACT_ADDRESS');
supplyChain.addProduct(12345).then(receipt => console.log(receipt));
console.log(supplyChain.getProductCount());

// market_data.js
import WebSocket from 'ws';
import { MarketData } from 'arket-data-sdk';

class MarketDataFeed {
    constructor(apiKey) {
        this.apiKey = apiKey;
        this.ws = new WebSocket('wss://market-data-api.io/v1/ws');
        this.marketData = new MarketData();

        this.ws.onmessage = (event) => {
            const data = JSON.parse(event.data);
            this.marketData.update(data);
        };
    }

    async getMarketData(symbol) {
        return this.marketData.get(symbol);
    }
}

// did_manager.js
import { ethers } from 'ethers';
import { DID } from 'did-sdk';

class DIDManager {
    constructor(privateKey) {
        this.privateKey = privateKey;
        this.did = new DID();
    }

    async createDID() {
        const didDocument = await this.did.createDID(this.privateKey);
        return didDocument;
    }

    async resolveDID(did) {
        const didDocument = await this.did.resolveDID(did);
        return didDocument;
    }

    async updateDID(did, updates) {
        const didDocument = await this.did.updateDID(did, updates, this.privateKey);
        return didDocument;
    }
}

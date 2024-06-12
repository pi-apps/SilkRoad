import { useState, useEffect } from 'eact';
import { useBlockchain } from '@silkroad/blockchain';
import { Product } from '@silkroad/models';

const BlockchainSupplyChainManagement = () => {
  const [product, setProduct] = useState(null);
  const [supplyChainData, setSupplyChainData] = useState(null);

  useEffect(() => {
    const blockchainInstance = useBlockchain();
    blockchainInstance.getSupplyChainData(product).then((supplyChainData) => {
      setSupplyChainData(supplyChainData);
    });
  }, [product]);

  return (
    <div>
      <h2>Blockchain Supply Chain Management</h2>
      <ProductSelector onProductChange={setProduct} />
      {supplyChainData && (
        <div>
          <h3>Supply Chain Data</h3>
          <ul>
            {supplyChainData.map((data) => (
              <li key={data.id}>{data.name}</li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
};

export default BlockchainSupplyChainManagement;

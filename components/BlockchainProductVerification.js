import { useState, useEffect } from 'react';
import { useBlockchain } from '@silkroad/blockchain';
import { Product } from '@silkroad/models';

const BlockchainProductVerification = () => {
  const [product, setProduct] = useState(null);
  const [blockchain, setBlockchain] = useState(null);

  useEffect(() => {
    const blockchainInstance = useBlockchain();
    setBlockchain(blockchainInstance);
    loadProduct();
  }, []);

  const loadProduct = async () => {
    const productData = await Product.load('product-data.json');
    setProduct(productData);
  };

  const handleVerifyProduct = async () => {
    if (blockchain && product) {
      const verificationResult = await blockchain.verifyProduct(product);
      console.log(verificationResult);
    }
  };

  return (
    <div>
      <h2>Blockchain Product Verification</h2>
      {product && (
        <div>
          <p>Product ID: {product.id}</p>
          <p>Product Name: {product.name}</p>
          <button onClick={handleVerifyProduct}>Verify Product</button>
        </div>
      )}
    </div>
  );
};

export default BlockchainProductVerification;

import { useState, useEffect } from 'eact';
import { useEdgeComputing } from '@silkroad/edge-computing';
import { Product } from '@silkroad/models';

const EdgeComputingProductProcessing = () => {
  const [product, setProduct] = useState(null);
  const [processedProduct, setProcessedProduct] = useState(null);
  const [edgeComputing, setEdgeComputing] = useState(null);

  useEffect(() => {
    const edgeComputingInstance = useEdgeComputing();
    setEdgeComputing(edgeComputingInstance);
  }, []);

  const handleProcessProduct = async () => {
    if (edgeComputing && product) {
      const processedProduct = await edgeComputing.processProduct(product);
      setProcessedProduct(processedProduct);
    }
  };

  return (
    <div>
      <h2>Edge Computing Product Processing</h2>
      <ProductSelector onProductChange={setProduct} />
      <button onClick={handleProcessProduct}>Process Product</button>
      {processedProduct && <ProductCard product={processedProduct} />}
    </div>
  );
};

export default EdgeComputingProductProcessing;

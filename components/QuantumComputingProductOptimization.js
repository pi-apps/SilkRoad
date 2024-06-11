import { useState, useEffect } from 'react';
import { useQuantumComputing } from '@silkroad/quantum-computing';
import { Product } from '@silkroad/models';

const QuantumComputingProductOptimization = () => {
  const [product, setProduct] = useState(null);
  const [optimizedProduct, setOptimizedProduct] = useState(null);
  const [quantumComputing, setQuantumComputing] = useState(null);

  useEffect(() => {
    const quantumComputingInstance = useQuantumComputing();
    setQuantumComputing(quantumComputingInstance);
  }, []);

  const handleProductChange = (product) => {
    setProduct(product);
  };

  const handleOptimizeProduct = async () => {
    if (quantumComputing && product) {
      const optimizedProduct = await quantumComputing.optimizeProduct(product);
      setOptimizedProduct(optimizedProduct);
    }
  };

  return (
    <div>
      <h2>Quantum Computing Product Optimization</h2>
      <ProductSelector onProductChange={handleProductChange} />
      <button onClick={handleOptimizeProduct}>Optimize Product</button>
      {optimizedProduct && <ProductCard product={optimizedProduct} />}
    </div>
  );
};

export default QuantumComputingProductOptimization;

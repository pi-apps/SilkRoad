import { useState, useEffect } from 'eact';
import { useRealtime } from '@silkroad/realtime';
import { Product } from '@silkroad/models';

const RealtimeProductRecommendation = () => {
  const [recommendedProducts, setRecommendedProducts] = useState([]);
  const [realtime, setRealtime] = useState(null);

  useEffect(() => {
    const realtimeInstance = useRealtime();
    setRealtime(realtimeInstance);
    realtimeInstance.subscribe('product-recommendations', (data) => {
      setRecommendedProducts(data);
    });
  }, []);

  return (
    <div>
      <h2>Realtime Product Recommendations</h2>
      <ul>
        {recommendedProducts.map((product) => (
          <li key={product.id}>
            <ProductCard product={product} />
          </li>
        ))}
      </ul>
    </div>
  );
};

export default RealtimeProductRecommendation;

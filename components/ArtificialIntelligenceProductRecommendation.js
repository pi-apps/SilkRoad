import { useState, useEffect } from 'eact';
import { useAI } from '@silkroad/ai';
import { Product } from '@silkroad/models';

const ArtificialIntelligenceProductRecommendation = () => {
  const [product, setProduct] = useState(null);
  const [recommendedProducts, setRecommendedProducts] = useState([]);

  useEffect(() => {
    const aiInstance = useAI();
    aiInstance.getRecommendedProducts(product).then((recommendedProducts) => {
      setRecommendedProducts(recommendedProducts);
    });
  }, [product]);

  return (
    <div>
      <h2>Artificial Intelligence Product Recommendation</h2>
      <ProductSelector onProductChange={setProduct} />
      {recommendedProducts.length > 0 && (
        <div>
          <h3>Recommended Products</h3>
          <ul>
            {recommendedProducts.map((product) => (
              <li key={product.id}>{product.name}</li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
};

export default ArtificialIntelligenceProductRecommendation;

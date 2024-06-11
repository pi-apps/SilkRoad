import { useState, useEffect } from 'react';
import { useAIModel } from '@silkroad/ai-models';
import { ProductCard } from '@silkroad/components';

const AIProductRecommendation = () => {
  const [recommendedProducts, setRecommendedProducts] = useState([]);
  const [userPreferences, setUserPreferences] = useState({});

  useEffect(() => {
    const aiModel = useAIModel('product-recommendation');
    aiModel.predict(userPreferences).then((response) => {
      setRecommendedProducts(response.data);
    });
  }, [userPreferences]);

  const handleUserInput = (input) => {
    setUserPreferences((prevPreferences) => ({ ...prevPreferences, [input.name]: input.value }));
  };

  return (
    <div>
      <h2>Recommended Products</h2>
      <ul>
        {recommendedProducts.map((product) => (
          <li key={product.id}>
            <ProductCard product={product} />
          </li>
        ))}
      </ul>
      <form>
        <label>
          Age:
          <input type="number" name="age" onChange={handleUserInput} />
        </label>
        <label>
          Gender:
          <select name="gender" onChange={handleUserInput}>
            <option value="male">Male</option>
            <option value="female">Female</option>
          </select>
        </label>
        <label>
          Interests:
          <textarea name="interests" onChange={handleUserInput} />
        </label>
      </form>
    </div>
  );
};

export default AIProductRecommendation;

import { useState, useEffect } from 'eact';
import { useNeuralNetwork } from '@silkroad/neural-network';
import { Product } from '@silkroad/models';

const NeuralNetworkProductSearch = () => {
  const [searchQuery, setSearchQuery] = useState('');
  const [searchResults, setSearchResults] = useState([]);
  const [neuralNetwork, setNeuralNetwork] = useState(null);

  useEffect(() => {
    const neuralNetworkInstance = useNeuralNetwork();
    setNeuralNetwork(neuralNetworkInstance);
  }, []);

  const handleSearch = async () => {
    if (neuralNetwork) {
      const searchResults = await neuralNetwork.searchProducts(searchQuery);
      setSearchResults(searchResults);
    }
  };

  return (
    <div>
      <h2>Neural Network Product Search</h2>
      <input
        type="text"
        value={searchQuery}
        onChange={(e) => setSearchQuery(e.target.value)}
        placeholder="Search for products"
      />
      <button onClick={handleSearch}>Search</button>
      <ul>
        {searchResults.map((product) => (
          <li key={product.id}>
            <ProductCard product={product} />
          </li>
        ))}
      </ul>
    </div>
  );
};

export default NeuralNetworkProductSearch;

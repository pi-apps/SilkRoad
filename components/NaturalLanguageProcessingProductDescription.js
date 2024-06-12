import { useState, useEffect } from 'eact';
import { useNaturalLanguageProcessing } from '@silkroad/natural-language-processing';
import { Product } from '@silkroad/models';

const NaturalLanguageProcessingProductDescription =() => {
  const [productDescription, setProductDescription] = useState('');
  const [descriptionSummary, setDescriptionSummary] = useState('');
  const [naturalLanguageProcessing, setNaturalLanguageProcessing] = useState(null);

  useEffect(() => {
    const naturalLanguageProcessingInstance = useNaturalLanguageProcessing();
    setNaturalLanguageProcessing(naturalLanguageProcessingInstance);
  }, []);

  const handleDescriptionChange = (e) => {
    setProductDescription(e.target.value);
  };

  const handleSummaryGeneration = async () => {
    if (naturalLanguageProcessing) {
      const summary = await naturalLanguageProcessing.generateDescriptionSummary(
        productDescription
      );
      setDescriptionSummary(summary);
    }
  };

  return (
    <div>
      <h2>Natural Language Processing Product Description</h2>
      <textarea value={productDescription} onChange={handleDescriptionChange} />
      <button onClick={handleSummaryGeneration}>Generate Summary</button>
      <p>{descriptionSummary}</p>
    </div>
  );
};

export default NaturalLanguageProcessingProductDescription;

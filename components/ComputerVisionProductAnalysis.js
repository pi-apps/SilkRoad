import { useState, useEffect } from 'eact';
import { useComputerVision } from '@silkroad/computer-vision';
import { Product } from '@silkroad/models';

const ComputerVisionProductAnalysis = () => {
  const [productImage, setProductImage] = useState(null);
  const [analysisResults, setAnalysisResults] = useState({});
  const [computerVision, setComputerVision] = useState(null);

  useEffect(() => {
    const computerVisionInstance = useComputerVision();
    setComputerVision(computerVisionInstance);
  }, []);

  const handleImageUpload = async (image) => {
    if (computerVision) {
      const analysisResults = await computerVision.analyzeProductImage(image);
      setAnalysisResults(analysisResults);
    }
  };

  return (
    <div>
      <h2>Computer Vision Product Analysis</h2>
      <input
        type="file"
        accept="image/*"
        onChange={(e) => handleImageUpload(e.target.files[0])}
      />
      <ul>
        {Object.keys(analysisResults).map((key) => (
          <li key={key}>
            <strong>{key}</strong>: {analysisResults[key]}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ComputerVisionProductAnalysis;

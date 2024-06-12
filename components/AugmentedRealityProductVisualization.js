import { useState, useEffect } from 'eact';
import { useAR } from '@silkroad/ar';
import { Product } from '@silkroad/models';

const AugmentedRealityProductVisualization = () => {
  const [product, setProduct] = useState(null);
  const [arSession, setARSession] = useState(null);
  const [arModel, setARModel] = useState(null);
  const [arView, setARView] = useState(null);

  useEffect(() => {
    const arInstance = useAR();
    setARSession(arInstance.createSession());
    setARModel(arInstance.createModel(product));
    setARView(arInstance.createView());
  }, [product]);

  return (
    <div>
      <h2>Augmented Reality Product Visualization</h2>
      <ProductSelector onProductChange={setProduct} />
      {arSession && arView && (
        <div>
          <ARView ref={setARView} style={{ width: '100%', height: '500px' }} />
        </div>
      )}
    </div>
  );
};

export default AugmentedRealityProductVisualization;

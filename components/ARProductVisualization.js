import { useState, useEffect } from 'react';
import { useAR } from '@silkroad/ar';
import { ProductModel } from '@silkroad/models';

const ARProductVisualization = () => {
  const [productModel, setProductModel] = useState(null);
  const [arSession, setARSession] = useState(null);

  useEffect(() => {
    const ar = useAR();
    ar.init().then((session) => {
      setARSession(session);
      loadProductModel();
    });
  }, []);

  const loadProductModel = async () => {
    const model = await ProductModel.load('product.glb');
    setProductModel(model);
  };

  const handleARSessionUpdate = (session) => {
    if (session && productModel) {
      session.addModel(productModel);
    }
  };

  return (
    <div>
      <h2>AR Product Visualization</h2>
      {arSession && (
        <div>
          <ar-session ref={handleARSessionUpdate} />
          <ar-model src={productModel.src} />
        </div>
      )}
    </div>
  );
};

export default ARProductVisualization;

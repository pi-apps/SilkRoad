import { useState, useEffect } from 'react';
import { useVR } from '@silkroad/vr';
import { ProductModel } from '@silkroad/models';

const VRProductExploration = () => {
  const [productModel, setProductModel] = useState(null);
  const [vrSession, setVRSession] = useState(null);

  useEffect(() => {
    const vr = useVR();
    vr.init().then((session) => {
      setVRSession(session);
      loadProductModel();
    });
  }, []);

  const loadProductModel = async () => {
    const model = await ProductModel.load('product.glb');
    setProductModel(model);
  };

  const handleVRSessionUpdate = (session) => {
    if (session && productModel) {
      session.addModel(productModel);
    }
  };

  return (
    <div>
      <h2>VR Product Exploration</h2>
      {vrSession && (
        <div>
          <vr-session ref={handleVRSessionUpdate} />
          <vr-model src={productModel.src} />
        </div>
      )}
    </div>
  );
};

export default VRProductExploration;

import { useState, useEffect } from 'eact';
import { useDroneDelivery } from '@silkroad/drone-delivery';
import { Product } from '@silkroad/models';

const DroneDelivery = () => {
  const [product, setProduct] = useState(null);
  const [droneDelivery, setDroneDelivery] = useState(null);
  const [deliveryStatus, setDeliveryStatus] = useState(null);

  useEffect(() => {
    const droneDeliveryInstance = useDroneDelivery();
    setDroneDelivery(droneDeliveryInstance);
  }, []);

  const handleRequestDelivery = async () => {
    if (droneDelivery && product) {
      const deliveryStatus = await droneDelivery.requestDelivery(product);
      setDeliveryStatus(deliveryStatus);
    }
  };

  return (
    <div>
      <h2>Drone Delivery</h2>
      <ProductSelector onProductChange={setProduct} />
      <button onClick={handleRequestDelivery}>Request Delivery</button>
      {deliveryStatus && <p>Delivery status: {deliveryStatus}</p>}
    </div>
  );
};

export default DroneDelivery;

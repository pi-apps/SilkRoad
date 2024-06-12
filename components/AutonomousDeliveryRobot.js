import { useState, useEffect } from 'eact';
import { useAutonomousDelivery } from '@silkroad/autonomous-delivery';

const AutonomousDeliveryRobot = () => {
  const [deliveryRobot, setDeliveryRobot] = useState(null);
  const [deliveryStatus, setDeliveryStatus] = useState(null);

  useEffect(() => {
    const deliveryRobotInstance = useAutonomousDelivery();
    setDeliveryRobot(deliveryRobotInstance);
  }, []);

  const handleStartDelivery = async () => {
    if (deliveryRobot) {
      const deliveryStatus = await deliveryRobot.startDelivery();
      setDeliveryStatus(deliveryStatus);
    }
  };

  return (
    <div>
      <h2>Autonomous Delivery Robot</h2>
      <button onClick={handleStartDelivery}>Start Delivery</button>
      {deliveryStatus && <p>Delivery status: {deliveryStatus}</p>}
    </div>
  );
};

export default AutonomousDeliveryRobot;

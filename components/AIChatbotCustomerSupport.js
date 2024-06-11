import { useState, useEffect } from 'react';
import { useAIChatbot } from '@silkroad/ai-chatbot';

const AIChatbotCustomerSupport = () => {
  const [chatbot, setChatbot] = useState(null);
  const [messages, setMessages] = useState([]);

  useEffect(() => {
    const chatbotInstance = useAIChatbot();
    setChatbot(chatbotInstance);
  }, []);

  const handleSendMessage = (message) => {
    if (chatbot) {
      chatbot.sendMessage(message).then((response) => {
        setMessages((prevMessages) => [...prevMessages, { sender: 'user', text: message }, { sender: 'bot', text: response }]);
      });
    }
  };

  return (
    <div>
      <h2>AI Chatbot Customer Support</h2>
      <ChatWindow messages={messages} onSendMessage={handleSendMessage} />
    </div>
  );
};

export default AIChatbotCustomerSupport;

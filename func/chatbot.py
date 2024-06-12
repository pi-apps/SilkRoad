import random
import re
import nltk
from nltk.chat.util import Chat, reflections
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

# Define the chatbot's responses
past_orders_patterns = [
    r"What are my past orders\?",
    r"Can you show me my order history\?",
    r"Have I ordered anything from you before\?"
]
past_orders_responses = [
    "I'm sorry, I'm unable to access your account information. Please contact customer support for assistance with your past orders.",
    "Sure, you can check your past orders by logging into your account on our website.",
    "Unfortunately, I don't have access to your order history. Please contact customer support for assistance."
]

product_recommendations_patterns = [
    r"Can you recommend a product\?",
    r"What should I buy\?",
    r"What do you suggest\?"
]
product_recommendations_responses = [
    "Sure, I can recommend some popular products on our website. Here are a few: \n1. Product A\n2. Product B\n3. Product C",
    "I recommend checking out our best-sellers section for some great product recommendations.",
    "Based on your browsing history, I recommend checking out Product X. It's a popular choice among our customers."
]

customer_support_patterns = [
    r"I need help with my order\.",
    r"I have a question about my order\.",
    r"My order is missing something\.",
    r"I have a problem with my order\."
]
customer_support_responses = [
    "I'm sorry, I'm unable to access your account information. Please contact customer support for assistance with your order.",
    "Sure, I can help you with some common issues. Here are a few: \n1. Check your order status by logging into your account on our website.\n2. Contact the seller if there is an issue with the product.\n3. Contact customer support if you need to return or exchange the product.",
    "I'm sorry, I can't help with that. Please contact customer support for further assistance."
]

# Define the chatbot's patterns and responses
patterns = past_orders_patterns + product_recommendations_patterns + customer_support_patterns
responses = past_orders_responses + product_recommendations_responses + customer_support_responses

# Define the chatbot's reflections
reflections = {
    "i'm": "you're",
    "i": "you",
    "am": "are",
    "my": "your",
    "i'd": "you'd",
    "i'll": "you'll",
    "my": "your",
    "mine": "yours",
    "you": "I",
    "you're": "I'm",
    "you've": "I've",
    "you'll": "I'll",
    "your": "my",
    "yours": "mine",
    "yourself": "myself"
}

# Define the chatbot's NLP and ML algorithms
def preprocess_text(text):
    """Preprocesses the text by removing stopwords and punctuation."""
    stopwords = nltk.corpus.stopwords.words("english")
    words = nltk.word_tokenize(text.lower())
    words = [word for word in words if word.isalnum() and word not in stopwords]
    return " ".join(words)

def get_similarity_score(query, sentences):
    """Calculates the similarity score between the query and a list of sentences."""
    vectorizer = TfidfVectorizer()
    X = vectorizer.fit_transform(sentences)
    query_vector = vectorizer.transform([query])
    score = cosine_similarity(query_vector, X)return score.max()

def recommend_response(query):
    """Recommends a response based on the query."""
    similarity_scores = []
    for i, pattern in enumerate(patterns):
        score = get_similarity_score(preprocess_text(query), preprocess_text(pattern))
        similarity_scores.append((score, i))
    similarity_scores.sort(key=lambda x: x[0], reverse=True)
    if similarity_scores[0][0] > 0.5:
        response_index = similarity_scores[0][1]
        return responses[response_index]
    else:
        return "I'm sorry, I don't understand your question. Can you please rephrase it?"

# Define the chatbot
def main():
    print("Hi, I'm the SilkRoad chatbot! How can I help you today?")
    chat = Chat(reflections)
    while True:
        user_input = input("You: ")
        if user_input.lower() == "bye":
            print("Chatbot: Bye! Have a great day!")
            break
        else:
            response = recommend_response(user_input)
            print("Chatbot: " + response)

if __name__ == '__main__':
    main()

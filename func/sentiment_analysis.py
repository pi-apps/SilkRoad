import re

import nltk
from nltk.corpus import stopwords
from nltk.stem import WordNetLemmatizer
from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline

# Define the sentiment analysis algorithm


def preprocess_text(text):
    """Preprocesses the text by removing stopwords and lemmatizing the words."""
    # Tokenize the text
    words = nltk.word_tokenize(text.lower())

    # Remove stopwords
    stopwords_set = set(stopwords.words("english"))
    words = [word for word in words if word not in stopwords_set]

    # Lemmatize the words
    lemmatizer = WordNetLemmatizer()
    words = [lemmatizer.lemmatize(word) for word in words]

    # Rejoin the words into a string
    text = " ".join(words)

    # Return the preprocessed text
    return text


def train_model(X_train, y_train):
    """Trains a sentiment analysis model on the given training data."""
    # Define the pipeline
    pipeline = Pipeline(
        [("vectorizer", TfidfVectorizer()), ("classifier", LogisticRegression())]
    )

    # Train the model
    model = pipeline.fit(X_train, y_train)

    # Return the trained model
    return model


def analyze_sentiment(model, text):
    """Analyzes the sentiment of the given text using the trained model."""
    # Preprocess the text
    text = preprocess_text(text)

    # Vectorize the text
    vectorizer = model["vectorizer"]
    X = vectorizer.transform([text])

    # Predict the sentiment
    classifier = model["classifier"]
    y_pred = classifier.predict(X)

    # Return the predicted sentiment
    return y_pred[0]


# Example usage
if __name__ == "__main__":
    # Load the customer reviews
    reviews = [
        {"text": "This product is amazing! I love it!", "sentiment": 1},
        {"text": "This product is okay, I guess.", "sentiment": 0},
        {"text": "This product is terrible. I hate it.", "sentiment": -1},
        # Add more reviews here...
    ]

    # Preprocess the reviews
    reviews = [
        {"text": preprocess_text(review["text"]), "sentiment": review["sentiment"]}
        for review in reviews
    ]

    # Split the reviews into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(
        [review["text"] for review in reviews],
        [review["sentiment"] for review in reviews],
        test_size=0.2,
        random_state=42,
    )

    # Train the sentiment analysis model
    model = train_model(X_train, y_train)

    # Evaluate the model on the testing set
    y_pred = model.predict(X_test)
    print(classification_report(y_test, y_pred))

    # Analyze the sentiment of a new review
    new_review = {"text": "This product is great! I really like it."}
    new_review = {"text": preprocess_text(new_review["text"])}
    sentiment = analyze_sentiment(model, new_review["text"])
    if sentiment == 1:
        print("Positive review")
    elif sentiment == 0:
        print("Neutral review")
    elif sentiment == -1:
        print("Negative review")

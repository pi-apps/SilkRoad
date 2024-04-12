import pandas as pd
import numpy as np
import re
import tensorflow as tf
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score

# Define the fraud detection algorithm
def preprocess_data(data):
    """Preprocesses the transaction data."""
    # Replace missing values with the mean of the column
    data = data.fillna(data.mean())

    # Convert categorical variables to one-hot encoding
    data = pd.get_dummies(data, columns=["country", "card_type"])

    # Extract the transaction amount
    data["amount"] = data["amount"].str.replace(r"[^\d.]", "").astype(float)

    # Extract the transaction time
    data["time"] = pd.to_datetime(data["time"])
    data["hour"] = data["time"].dt.hour
    data["day"] = data["time"].dt.day
    data["month"] = data["time"].dt.month
    data["year"] = data["time"].dt.year

    # Drop unnecessary columns
    data = data.drop(columns=["time"])

    # Return the preprocessed data
    return data

def build_model():
    """Builds a deep learning model for fraud detection."""
    # Define the input layer
    inputs = tf.keras.Input(shape=(data.shape[1],))

    # Add hidden layers
    x = tf.keras.layers.Dense(64, activation="relu")(inputs)
    x = tf.keras.layers.Dense(32, activation="relu")(x)

    # Add the output layer
    outputs = tf.keras.layers.Dense(1, activation="sigmoid")(x)

    # Define the model
    model = tf.keras.Model(inputs=inputs, outputs=outputs)

    # Compile the model
    model.compile(optimizer="adam", loss="binary_crossentropy", metrics=["accuracy"])

    # Return the model
    return model

def train_model(model, X_train, y_train):
    """Trains the fraud detection model."""
    # Define the callbacks
    callbacks = [
        tf.keras.callbacks.EarlyStopping(patience=5, monitor="val_loss"),
        tf.keras.callbacks.ModelCheckpoint("best_model.h5", save_best_only=True)
]

    # Train the model
    model.fit(
        X_train,
        y_train,
        epochs=10,
        batch_size=32,
        validation_split=0.2,
        callbacks=callbacks
    )

    # Load the best model
    model.load_weights("best_model.h5")

    # Return the trained model
    return model

def detect_fraud(model, transaction):
    """Detects fraud in the given transaction using the trained model."""
    # Preprocess the transaction data
    transaction = preprocess_data(transaction)

    # Vectorize the transaction data
    vectorizer = model["vectorizer"]
    X = vectorizer.transform(transaction)

    # Predict the fraud probability
    y_pred = model["model"].predict(X)
    fraud_prob = y_pred[:, 0]

    # Return the fraud probability and prediction
    return fraud_prob, np.round(fraud_prob)

# Example usage
if __name__ == "__main__":
    # Load the transaction data
    transactions = pd.read_csv("transactions.csv")

    # Preprocess the transaction data
    transactions = preprocess_data(transactions)

    # Split the transaction data into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(
        transactions.drop(columns=["fraud"]),
        transactions["fraud"],
        test_size=0.2,
        random_state=42
    )

    # Build and train the fraud detection model
    model = build_model()
    model = train_model(model, X_train, y_train)

    # Evaluate the model on the testing set
    y_pred = model["model"].predict(X_test)
    print("Accuracy:", accuracy_score(y_test, y_pred > 0.5))
    print("Precision:", precision_score(y_test, y_pred > 0.5))
    print("Recall:", recall_score(y_test, y_pred > 0.5))
    print("F1 score:", f1_score(y_test, y_pred > 0.5))

    # Detect fraud in a new transaction
    new_transaction = pd.DataFrame([{
        "country": "US",
        "card_type": "credit",
        "amount": "100.50",
        "hour": 12,
        "day": 15,
        "month": 3,
        "year": 2023
    }])
    fraud_prob, is_fraud = detect_fraud(model, new_transaction)
    if is_fraud == 1:
        print("Fraud detected!")
    else:
        print("No fraud detected.")
    print(f"Fraud probability: {fraud_prob}")

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from sklearn.metrics import mean_squared_error, r2_score
from sklearn.model_selection import train_test_split
from statsmodels.tsa.statespace.sarimax import SARIMAX


# Define the predictive analytics algorithm
def preprocess_data(data):
    """Preprocesses the inventory data."""
    # Replace missing values with the mean of the column
    data = data.fillna(data.mean())

    # Convert categorical variables to dummy variables
    data = pd.get_dummies(data, columns=["product"])

    # Extract the date
    data["date"] = pd.to_datetime(data["date"])
    data["year"] = data["date"].dt.year
    data["month"] = data["date"].dt.month
    data["day"] = data["date"].dt.day
    data = data.drop(columns=["date"])

    # Return the preprocessed data
    return data


def train_model(X_train, y_train):
    """Trains the predictive analytics model."""
    # Define the model
    model = SARIMAX(y_train, order=(1, 1, 1), seasonal_order=(1, 1, 1, 12))

    # Train the model
    model = model.fit()

    # Return the trained model
    return model


def predict_inventory(model, transaction):
    """Predicts the inventory level for the given transaction using the trained model."""
    # Preprocess the transaction data
    transaction = preprocess_data(transaction)

    # Vectorize the transaction data
    vectorizer = model["vectorizer"]
    X = vectorizer.transform(transaction)

    # Predict the inventory level
    inventory_level = model["model"].predict(start=len(X_train),
                                             end=len(X_train) + len(X) - 1)

    # Return the predicted inventory level
    return inventory_level


# Example usage
if __name__ == "__main__":
    # Load the inventory data
    inventory = pd.read_csv("inventory.csv")

    # Preprocess the inventory data
    inventory = preprocess_data(inventory)

    # Split the inventory data into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(
        inventory.drop(columns=["inventory"]),
        inventory["inventory"],
        test_size=0.2,
        random_state=42,
    )

    # Train the predictive analytics model
    model = train_model(X_train, y_train)

    # Evaluate the model on the testing set
    y_pred = model.predict(start=len(X_train),
                           end=len(X_train) + len(X_test) - 1)
    print("Mean squared error:", mean_squared_error(y_test, y_pred))
    print("R^2 score:", r2_score(y_test, y_pred))

    # Predict the inventory level for a new transaction
    new_transaction = pd.DataFrame([{
        "product": "product1",
        "year": 2023,
        "month": 3,
        "day": 15,
        "quantity_sold": 10,
        "quantity_returned": 2,
        "lead_time": 14,
        "order_frequency": 0.5,
    }])
    inventory_level = predict_inventory(model, new_transaction)
    print(f"Predicted inventory level: {inventory_level}")

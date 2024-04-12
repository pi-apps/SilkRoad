import pandas as pd
import numpy as np
import scipy.sparse as sp
import scipy.spatial.distance as spd
import sklearn.metrics.pairwise as pw
import sklearn.decomposition as decomp
import pickle

def recommend_products(user_id, num_recommendations):
    """Recommends products to the given user based on their past purchases and the recommendation model."""
    # Load the user purchase data and the recommendation model
    user_purchases = load_user_purchases(user_id)
    recommendation_model = load_recommendation_model()

    # Generate the recommendations using the recommendation model
    recommendations = recommendation_model.recommend(user_purchases, num_recommendations)

    # Return the recommended products
    return recommendations

def train_recommendation_model(user_purchase_data, num_components=50):
    """Trains a recommendation model based on the given user purchase data."""
    # Preprocess the user purchase data
    user_purchase_matrix = preprocess_user_purchase_data(user_purchase_data)

    # Train the recommendation model
    recommendation_model = decomp.TruncatedSVD(n_components=num_components)
    recommendation_model.fit(user_purchase_matrix)

    # Save the recommendation model
    save_recommendation_model(recommendation_model)

    # Return the trained recommendation model
    return recommendation_model

def evaluate_recommendation_model(user_purchase_data, recommendation_model):
    """Evaluates the given recommendation model based on the given user purchase data."""
    # Preprocess the user purchase data
    user_purchase_matrix = preprocess_user_purchase_data(user_purchase_data)

    # Evaluate the recommendation model
    evaluations = evaluate_model(user_purchase_matrix, recommendation_model)

    # Return the evaluation results
    return evaluations

def preprocess_user_purchase_data(user_purchase_data):
    """Preprocesses the given user purchase data into a sparse matrix."""
    # Create a sparse matrix from the user purchase data
    user_purchase_matrix = sp.csr_matrix((user_purchase_data["quantity"], (user_purchase_data["user_id"], user_purchase_data["product_id"])))

    # Return the preprocessed user purchase matrix
    return user_purchase_matrix

def load_user_purchases(user_id):
    """Loads the purchase data for the given user."""
    # Load the user purchase data from a database or file
    user_purchases = pd.read_csv(f"user_{user_id}_purchases.csv")

    # Return the user purchase data
    return user_purchases

def load_recommendation_model():
    """Loads the trained recommendation model."""
    # Load the recommendation model from a file
    recommendation_model = pickle.load(open("recommendation_model.pkl", "rb"))

    # Return the loaded recommendation model
    return recommendation_model

def save_recommendation_model(recommendation_model):
    """Saves the given recommendation model to a file."""
    # Save the recommendation model to a file
    pickle.dump(recommendation_model, open("recommendation_model.pkl", "wb"))

def evaluate_model(user_purchase_matrix, recommendation_model):
    """Evaluates the given recommendation model based on the given user purchase matrix."""
    # Evaluate the recommendation model using metrics such as precision, recall, and F1 score
    evaluations = {}
    evaluations["precision"] = metrics.precision_score(user_purchase_matrix.todense(), recommendation_model.recommend(user_purchase_matrix, 10)[:, 0].astype(int))
    evaluations["recall"] = metrics.recall_score(user_purchase_matrix.todense(), recommendation_model.recommend(user_purchase_matrix, 10)[:, 0].astype(int))
    evaluations["f1_score"] = metrics.f1_score(user_purchase_matrix.todense(), recommendation_model.recommend(user_purchase_matrix, 10)[:, 0].astype(int))

    # Return the evaluation results
    return evaluations

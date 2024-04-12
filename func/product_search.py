import os
import sys

import numpy as np
import tensorflow as tf
from PIL import Image
from sklearn.neighbors import NearestNeighbors

# Define the image recognition algorithm


def extract_features(image_path):
    """Extracts features from the given image."""
    # Load the pre-trained image recognition model
    model = tf.keras.applications.ResNet50(weights="imagenet")

    # Load the image
    image = Image.open(image_path)
    image = image.resize((224, 224))
    image_array = np.array(image) / 255.0

    # Preprocess the image
    image_array = np.expand_dims(image_array, axis=0)
    image_array = tf.keras.applications.resnet.preprocess_input(image_array)

    # Extract the features
    features = model.predict(image_array)

    # Return the features
    return features[0]


def search_products(image_path):
    """Searches for products similar to the given image."""
    # Extract features from the uploaded image
    uploaded_features = extract_features(image_path)

    # Query the database for products with similar features
    query = "SELECT * FROM products"
    results = query_db(query)
    features_db = []
    for result in results:
        # Extract features from the product image
        image_path = os.path.join("products", result["image"])
        product_features = extract_features(image_path)
        features_db.append(product_features)
    features_db = np.array(features_db)

    # Calculate the similarity between the uploaded image and the products in the database
    nbrs = NearestNeighbors(n_neighbors=5, algorithm="ball_tree").fit(features_db)
    distances, indices = nbrs.kneighbors([uploaded_features])

    # Return the search results
    search_results = []
    for i, index in enumerate(indices[0]):
        result = results[index]
        search_results.append(result)
    return search_results


# Example usage
if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python product_search.py <image_path>")
        sys.exit(1)
    image_path = sys.argv[1]
    results = search_products(image_path)
    for result in results:
        print(result)

import random
import math

def recommend_products(user_id, num_recommendations):
    """Recommends the top N products for the given user based on their past purchases and browsing history."""
    # Connect to the database
    connection = connect_to_db()

    # Create a cursor object
    cursor = connection.cursor()

    # Get the user's past purchases and browsing history
    cursor.execute("SELECT product_id FROM purchases WHERE user_id = %s", (user_id,))
    past_purchases = [row[0] for row in cursor.fetchall()]
    cursor.execute("SELECT product_id FROM browsing_history WHERE user_id = %s", (user_id,))
    browsing_history = [row[0] for row in cursor.fetchall()]

    # Get all products except the ones the user has already purchased or browsed
    cursor.execute("SELECT id, popularity FROM products WHERE id NOT IN (%s) AND id NOT IN (%s)", (",".join([str(p) for p in past_purchases]), ",".join([str(p) for p in browsing_history])))
    products = [row for row in cursor.fetchall()]

    # Calculate the similarity score between the user and each product
    scores = []
    for product in products:
        score = 0
        if product[1] > 0:
            score += math.log(product[1])
        if product[0] in past_purchases:
            score += 1
        if product[0] in browsing_history:
            score += 0.5
        scores.append((product[0], score))

    # Sort the products by score and get the top N
    scores.sort(key=lambda x: x[1], reverse=True)
    top_products = scores[:num_recommendations]

    # Close the cursor and connection
    cursor.close()
    connection.close()

    # Return the recommended products
    return [product[0] for product in top_products]

def get_product_recommendations(product_id):
    """Gets the recommended products for the given product."""
    # Connect to the database
    connection = connect_to_db()

    # Create a cursor object
    cursor = connection.cursor()

    # Get the product's category and subcategories
    cursor.execute("SELECT category, subcategory FROM products WHERE id = %s", (product_id,))
    product = cursor.fetchone()
    category = product[0]
    subcategories = product[1].split(",")

    # Get all products in the same category and subcategories
    subquery = ",".join(["%s"] * len(subcategories))
    cursor.execute("SELECT id FROM products WHERE category = %s AND subcategory IN (%s)", (category, subquery,) + tuple(subcategories))
    recommended_products = [row[0] for row in cursor.fetchall()]

    # Remove the given product from the recommended products
    recommended_products = [p for p in recommended_products if p != product_id]

    # Close the cursor and connection
    cursor.close()
    connection.close()

    # Return the recommended products
    return recommended_products

def update_product_recommendations():
    """Updates the product recommendations based on user behavior."""
    # Connect to the database
    connection = connect_to_db()

    # Create a cursor object
    cursor = connection.cursor()

    # Update the popularity of each product based on purchases
    cursor.execute("UPDATE products SET popularity = (SELECT COUNT(*) FROM purchases WHERE product_id = products.id)")

    # Update the browsing history of each user based on their activity
    cursor.execute("INSERT INTO browsing_history (user_id, product_id) SELECT user_id, product_id FROM views WHERE (user_id, product_id) NOT IN (SELECT user_id, product_id FROM browsing_history)")

    # Commit the transaction
    connection.commit()

    # Close the cursor and connection
    cursor.close()
    connection.close()

# Example usage
recommended_products = recommend_products(1, 10)
print(f"Recommended products: {recommended_products}")

recommended_products = get_product_recommendations(1)
print(f"Recommended products for product 1: {recommended_products}")

update_product_recommendations()

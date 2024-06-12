import re


def search_products(query):
    """Searches for products based on the given query."""
    # Connect to the database
    connection = connect_to_db()

    # Create a cursor object
    cursor = connection.cursor()

    # Escape special characters in the query
    query = re.escape(query)

    # Search for products with the given query in the name or description
    cursor.execute(
        "SELECT id, name, description FROM products WHERE name ILIKE %s OR description ILIKE %s",
        ("%" + query + "%", "%" + query + "%"),
    )
    products = [row for row in cursor.fetchall()]

    # Close the cursor and connection
    cursor.close()
    connection.close()

    # Return the search results
    return products


def filter_products(filters):
    """Filters products based on the given filters."""
    # Connect to the database
    connection = connect_to_db()

    # Create a cursor object
    cursor = connection.cursor()

    # Build the WHERE clause for the SQL query
    where_clause = ""
    for filter_name, filter_value in filters.items():
        if where_clause:
            where_clause += " AND "
        where_clause += f"{filter_name} = %s"

    # Filter the products based on the given filters
    cursor.execute(
        "SELECT id, name, description FROM products WHERE " + where_clause,
        tuple(filter_value.values()),
    )
    products = [row for row in cursor.fetchall()]

    # Close the cursor and connection
    cursor.close()
    connection.close()

    # Return the filtered products
    return products


def sort_products(sort_by, order):
    """Sorts products based on the given sorting criteria."""
    # Connect to the database
    connection = connect_to_db()

    # Create a cursor object
    cursor = connection.cursor()

    # Build the ORDER BY clause for the SQL query
    order_clause = ""
    if sort_by == "price":
        order_clause = "price"
    elif sort_by == "rating":
        order_clause = "rating"
    else:
        order_clause = "name"
    if order == "desc":
        order_clause += " DESC"

    # Sort the products based on the given sorting criteria
    cursor.execute(
        "SELECT id, name, description FROM products ORDER BY " + order_clause
    )
    products = [row for row in cursor.fetchall()]

    # Close the cursor and connection
    cursor.close()
    connection.close()

    # Return the sorted products
    return products


# Example usage
search_results = search_products("shirt")
print(f"Search results: {search_results}")

filtered_products = filter_products({"category": "men", "size": "M"})
print(f"Filtered products: {filtered_products}")

sorted_products = sort_products("price", "desc")
print(f"Sorted products: {sorted_products}")

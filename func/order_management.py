import datetime

def create_order(user_id, product_id, quantity, payment_method):
    """Creates a new order for the given user, product, quantity, and payment method."""
    # Connect to the database
    connection = connect_to_db()

    # Create a cursor object
    cursor = connection.cursor()

    # Get the current date and time
    now = datetime.datetime.now()

    # Insert the order into the orders table
    cursor.execute("INSERT INTO orders (user_id, product_id, quantity, payment_method, created_at) VALUES (%s, %s, %s, %s, %s)", (user_id, product_id, quantity, payment_method, now))

    # Commit the transaction
    connection.commit()

    # Get the order ID
    order_id = cursor.lastrowid

    # Close the cursor and connection
    cursor.close()
    connection.close()

    # Return the order ID
    return order_id

def update_order(order_id, status):
    """Updates the status of the given order."""
    # Connect to the database
    connection = connect_to_db()

    # Create a cursor object
    cursor = connection.cursor()

    # Update the order in the orders table
    cursor.execute("UPDATE orders SET status = %s WHERE id = %s", (status, order_id))

    # Commit the transaction
    connection.commit()

    # Close the cursor and connection
    cursor.close()
    connection.close()

def cancel_order(order_id):
    """Cancels the given order."""
    # Connect to the database
    connection = connect_to_db()

    # Create a cursor object
    cursor = connection.cursor()

    # Get the current date and time
    now = datetime.datetime.now()

    # Update the order in the orders table
    cursor.execute("UPDATE orders SET status = 'cancelled', cancelled_at = %s WHERE id = %s", (now, order_id))

    # Commit the transaction
    connection.commit()

    # Close the cursor and connection
    cursor.close()
    connection.close()

# Example usage
order_id = create_order(1, 1, 2, "credit_card")
print(f"Order ID: {order_id}")

update_order(order_id, "shipped")

cancel_order(order_id)

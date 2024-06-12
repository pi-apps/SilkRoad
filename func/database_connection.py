import psycopg2


def connect_to_db():
    """Connects to the database and returns a connection object."""
    # Define the connection parameters
    connection_params = {
        "host": "localhost",
        "database": "mydatabase",
        "user": "myuser",
        "password": "mypassword",
    }

    # Connect to the database
    connection = psycopg2.connect(**connection_params)

    # Return the connection object
    return connection


def query_db(query, params=None):
    """Queries the database and returns the result as a list of tuples."""
    # Connect to the database
    connection = connect_to_db()

    # Create a cursor object
    cursor = connection.cursor()

    # Execute the query
    if params:
        cursor.execute(query, params)
    else:
        cursor.execute(query)

    # Fetch the result
    result = cursor.fetchall()

    # Close the cursor and connection
    cursor.close()
    connection.close()

    # Return the result
    return result


def close_db_connection(connection):
    """Closes the given database connection."""
    # Close the connection
    connection.close()


# Example usage
query = "SELECT * FROM products WHERE price > %s"
params = (50,)
products = query_db(query, params)
print(products)

connection = connect_to_db()
close_db_connection(connection)

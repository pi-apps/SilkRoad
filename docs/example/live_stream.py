# Initialize the live stream
stream = LiveStream()

# Add a new customer to the live stream
customer = stream.add_customer()

# Start the live stream
stream.start()

# Stop the live stream
stream.stop()

# Remove the customer from the live stream
stream.remove_customer(customer)

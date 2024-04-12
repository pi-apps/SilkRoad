import logging
import sys

def handle_exception(exc_type, exc_value, exc_traceback):
    """Handles exceptions and logs the error message."""
    # Create a logger object
    logger = logging.getLogger(__name__)

    # Set the logging level
    logger.setLevel(logging.ERROR)

    # Create a file handler
    file_handler = logging.FileHandler("error.log")

    # Create a formatter
    formatter = logging.Formatter("%(asctime)s - %(levelname)s - %(message)s")

    # Set the formatter for the file handler
    file_handler.setFormatter(formatter)

    # Add the file handler to the logger
    logger.addHandler(file_handler)

    # Log the error message
    logger.error(f"{exc_type.__name__}: {exc_value}")

    # Display an error message to the user
    print("An error has occurred. Please contact the system administrator.")

    # Exit the program
    sys.exit(1)

def log_error(message):
    """Logs the given error message."""
    # Create a logger object
    logger = logging.getLogger(__name__)

    # Set the logging level
    logger.setLevel(logging.ERROR)

    # Create a file handler
    file_handler = logging.FileHandler("error.log")

    # Create a formatter
    formatter = logging.Formatter("%(asctime)s - %(levelname)s - %(message)s")

    # Set the formatter for the file handler
    file_handler.setFormatter(formatter)

    # Add the file handler to the logger
    logger.addHandler(file_handler)

    # Log the error message
    logger.error(message)

def display_error_message(message):
    """Displays the given error message to the user."""
    # Display the error message
    print(message)

# Example usage
try:
    # Perform some action that may raise an exception
    raise Exception("An error has occurred.")
except Exception as e:
    handle_exception(type(e), e, sys.exc_info()[2])

log_error("A non-critical error has occurred.")

display_error_message("An error has occurred.")

from flask import Flask, render_template
import os
import silkroad  # Import the SilkRoad module

app = Flask(__name__)

# Initialize the SilkRoad module
silkroad.init(os.path.join(os.getcwd(), 'silkroad'))

@app.route("/")
def index():
    return render_template("index.html")

if __name__ == "__main__":
    app.run(debug=True)

@app.route('/products', methods=['GET'])
def products():
    # TO DO: Implement product showcase logic here
    return render_template('products.html')

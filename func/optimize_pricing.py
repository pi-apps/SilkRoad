import numpy as np
import pandas as pd
import xgboost as xgb

# Load the historical sales data
sales_data = pd.read_csv("sales_data.csv")

# Preprocess the data
sales_data["date"] = pd.to_datetime(sales_data["date"])
sales_data["year"] = sales_data["date"].dt.year
sales_data["month"] = sales_data["date"].dt.month
sales_data["day"] = sales_data["date"].dt.day
sales_data["day_of_week"] = sales_data["date"].dt.dayofweek
sales_data["competitor_price"] = np.random.uniform(100,
                                                   200,
                                                   size=len(sales_data))
sales_data["price"] = np.random.uniform(50, 150, size=len(sales_data))
sales_data = sales_data.drop(["date"], axis=1)

# Define the target variable
y = sales_data["revenue"]

# Define the input features
X = sales_data.drop(["revenue"], axis=1)

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X,
                                                    y,
                                                    test_size=0.2,
                                                    random_state=42)

# Train the XGBoost model
xgb_model = xgb.XGBRegressor(
    objective="reg:squarederror",
    colsample_bytree=0.3,
    learning_rate=0.1,
    max_depth=5,
    alpha=10,
    n_estimators=1000,
)
xgb_model.fit(X_train, y_train)

# Evaluate the model
y_pred = xgb_model.predict(X_test)
mse = mean_squared_error(y_test, y_pred)
print("MSE:", mse)


# Define a function to optimize product pricing
def optimize_pricing(product_id, base_price, competitor_price):
    # Define the input features
    X_new = pd.DataFrame({
        "product_id": [product_id],
        "base_price": [base_price],
        "competitor_price": [competitor_price],
    })

    # Predict the revenue
    revenue = xgb_model.predict(X_new)

    # Return the optimized price
    return (base_price - 0.1 *
            (base_price - competitor_price) if revenue > 1000 else base_price)


# Test the optimize_pricing function
product_id = 1
base_price = 120
competitor_price = 110
optimized_price = optimize_pricing(product_id, base_price, competitor_price)
print("Optimized price:", optimized_price)

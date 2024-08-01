from flask import Flask, request, jsonify
import sqlite3

app = Flask(__name__)

# Connect to SQLite Database
def get_db_connection():
    conn = sqlite3.connect('store.db')
    conn.row_factory = sqlite3.Row
    return conn

# Get all products
@app.route('/products', methods=['GET'])
def get_products():
    conn = get_db_connection()
    products = conn.execute('SELECT * FROM products').fetchall()
    conn.close()
    return jsonify([dict(row) for row in products])

# Add a new order
@app.route('/orders', methods=['POST'])
def add_order():
    order_details = request.json
    conn = get_db_connection()
    conn.execute('INSERT INTO orders (customer_id, product_id, quantity, order_date) VALUES (?, ?, ?, ?)',
                 (order_details['customer_id'], order_details['product_id'], order_details['quantity'], order_details['order_date']))
    conn.commit()
    conn.close()
    return {'status': 'Order added'}, 200

if __name__ == '__main__':
    app.run(debug=True)

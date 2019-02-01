from customers import *
from profiles import *
from products import *

class Orders(db.Model):
    __tablename__ ='orders'
    order_id = db.Column('order_id',db.Integer, primary_key=True)
    user_id = db.Column('user_id',db.Integer)
    created_date = db.Column('created_date',db.DATETIME)
    
class Order_Details(db.Model):
    __tablename__ ='order_details'
    order_details_id = db.Column('order_details_id',db.Integer, primary_key=True)
    order_id = db.Column('order_id',db.Integer, foreign_key=True)
    product_id = db.Column('product_id',db.Integer, foreign_key=True)
    created_date = db.Column('created_date',db.DATETIME)


@app.route('/orders', methods=['GET'])
@token_required
def orders(user):

    orders = Order_Details.query.all()

    output = []
        
    for order in orders:

        orders_data = {}
        orders_data['order_details_id'] = order.order_details_id
        orders_data['order_id'] = order.order_id
        orders_data['created_date'] = datetime.utcnow()
        orders_data['product_id'] = order.product_id
        
        output.append(orders_data)
    return jsonify({'order_details': output})


@app.route('/placeorder', methods=['POST'])
@token_required
def placeorder(user):
    data = request.get_json()

    new_order = Order_Details(order_details_id=data['order_details_id'],order_id=orders.id,created_date=datetime.utcnow(),product_id=data['product_id'])

    db.session.add(new_order)
    db.session.commit()

    return jsonify({'message': 'Your order has been placed'})


if __name__ == '__main__':
    app.run(debug=True)
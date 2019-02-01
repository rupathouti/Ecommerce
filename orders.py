from customers import *
from profiles import *
from products import *

class Orders(db.Model):
    __tablename__ ='orders'
    id = db.Column('id',db.Integer, primary_key=True)
    user_id = db.Column('user_id',db.Integer)
    created_date = db.Column('created_date',db.DATETIME)
    
class Order_Details(db.Model):
    __tablename__ ='order_details'
    id = db.Column('id',db.Integer, primary_key=True)
    order_id = db.Column('order_id',db.Integer)
    product_id = db.Column('product_id',db.Integer)
    created_date = db.Column('created_date',db.DATETIME)
    modified_date = db.Column('modified_date',db.DATETIME)

@app.route('/placeorder', methods=['POST'])
@token_required
def placeorder(user):
    data = request.get_json()
    from sqlalchemy import text
    db.session.execute(text("call usp_placeorder(:pid,:uid)"),{"pid":data['product_id'],"uid":user.id})
        
    # db.session.commit()
    return jsonify({'message': 'Your order has been placed'})

if __name__ == '__main__':
    app.run(debug=False)
from customers import *
from profiles import *

class Products(db.Model):
    __tablename__ ='products'
    product_id = db.Column('product_id',db.Integer, primary_key=True)
    product_name = db.Column('product_name',db.Text)
    created_date = db.Column('created_date',db.DATETIME)
    cost = db.Column('cost',db.Integer)
    

@app.route('/products', methods=['GET'])
def all_products():
    products = Products.query.all()

    output = []
        
    for product in products:

        products_data = {}
        products_data['product_id'] = product.product_id
        products_data['product_name'] = product.product_name
        products_data['cost'] = product.cost
        output.append(products_data)
    return jsonify({'products': output})

@app.route('/admin/products', methods=['GET'])
@token_required
def products(user):
    products = Products.query.all()

    output = []
        
    for product in products:

        products_data = {}
        products_data['product_id'] = product.product_id
        products_data['product_name'] = product.product_name
        products_data['cost'] = product.cost
        output.append(products_data)
    return jsonify({'products': output})
        

@app.route('/admin/product', methods=['POST'])
@token_required
def add_products(user):
    data = request.get_json()

    product = Products.query.filter_by(product_name=data['product_name'])

    if product.count() == 0:
        new_product = Products(product_name=data['product_name'],created_date=datetime.utcnow(),cost=data['cost'])

        db.session.add(new_product)
        db.session.commit()

        return jsonify({'message': 'The New Product has been added'})

    else:
        return jsonify({'message': 'The Product is already present'})


@app.route('/admin/product/<int:id>', methods=['PUT'])
@token_required
def update_product(user,id):

    product = Products.query.filter_by(product_id=user.id).first()

    if not product:
        return jsonify({'Message': 'No product to update'})
    else:
        data = request.get_json()
        product.product_name = data['product_name']
        product.cost = data['cost']
        db.session.add(product)
        db.session.commit()
        return jsonify({'Message': 'The product has been updated'})

@app.route('/product/<int:id>', methods=['DELETE'])
@token_required
def delete_product(user,id):
    product = Products.query.filter_by(id=id,user_id=user.id).first()

    if not product:
        return jsonify({'Message': 'No product to delete'})
    else:
        db.session.delete(product)
        db.session.commit()

        return jsonify({'Message': 'Product has been deleted successfully'})

if __name__ == '__main__':
    app.run(debug=True)
from customers import *

class Profiles(db.Model):
    __tablename__ ='profiles'
    id = db.Column('id',db.Integer, primary_key=True)
    fname = db.Column('fname',db.String, primary_key=True)
    lname = db.Column('lname',db.String, primary_key=True)
    age = db.Column('age',db.Integer)
    mobile = db.Column('mobile',db.String)
    created_date = db.Column('created_date',db.DATETIME),
    modified_date = db.Column('modified_date',db.DATETIME),
    user_id = db.Column('user_id',db.Integer)

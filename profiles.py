from customers import *
from datetime import datetime

class Profiles(db.Model):
    __tablename__ ='profiles'
    id = db.Column('id',db.Integer, primary_key=True, autoincrement=True)
    fname = db.Column('fname',db.String)
    lname = db.Column('lname',db.String)
    age = db.Column('age',db.Integer)
    mobile = db.Column('mobile',db.String)
    created_date = db.Column('created_date',db.String)
    modified_date = db.Column('modified_date',db.String)
    user_id = db.Column('user_id',db.Integer)


@app.route('/profile', methods=['GET'])
@token_required
def get_profile(user):
    profiles = Profiles.query.filter_by(user_id=user.id).first()
    # calc = []
   
    # if profiles.count() == 0:
    if not profiles:
        profiles = Profiles()
        profiles_data = {}
        profiles_data['fname'] = ""
        profiles_data['lname'] = ""
        profiles_data['age'] = ""
        profiles_data['mobile'] = ""
            
        return jsonify({'profile': profiles_data})

    else:
        profiles_data = {}
        profiles_data['fname'] = profiles.fname
        profiles_data['lname'] = profiles.lname
        profiles_data['age'] = profiles.age
        profiles_data['mobile'] = profiles.mobile
        
        return jsonify({'profile': profiles_data})
        

@app.route('/profile', methods=['PUT'])
@token_required
def update_profiles(user):

    profiles = Profiles.query.filter_by(user_id=user.id).first()
    
    if not profiles:
        
        profiles = Profiles() #initialize the nonetype
        data = request.get_json()
        profiles.fname = data['fname']
        profiles.lname = data['lname']
        profiles.age = data['age']
        profiles.mobile = data['mobile']
        profiles.user_id = user.id
        db.session.add(profiles)
        db.session.commit()
        return jsonify({'Message': 'Your profile has been updated'})


if __name__ == '__main__':
    app.run(debug=False)

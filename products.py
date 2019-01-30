

class Tasks(db.Model):
    __tablename__ ='tasks'
    id = db.Column('id',db.Integer, primary_key=True)
    title = db.Column('title',db.Text, primary_key=True)
    description = db.Column('description',db.Text, primary_key=True)
    done = db.Column('done',db.Boolean, primary_key=True)
    user_id = db.Column('user_id',db.Integer)
from flask import Flask
from flaskext.mysql  import MySQL

import os

app = Flask(__name__)
app.secret_key = os.urandom(64)
mysql = MySQL(app)

app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = '123456'
app.config['MYSQL_DATABASE_DB'] = 'mydb'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

import bank
import application
import db

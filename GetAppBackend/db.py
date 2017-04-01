from GetAppBackend import mysql

def add_client ():
    connecection = mysql.get_db()
    cursor = connecection.cursor()
    cursor.execute ("INSERT INTO `Client` (`username`,`firstName`,`email`,`phone`) VALUES ('Vasya', 'Vasya', 'myemail@mail.com','8912345****')");
    connecection.commit()
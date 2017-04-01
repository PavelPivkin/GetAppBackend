from GetAppBackend import mysql

connecection = mysql.get_db()
cursor = connecection.cursor()

# INSERT
def add_client ():    
    return

def add_group ():
	return

# UPDATE
def update_card_balance (cardId, amount):
	cursor.execute ("UPDATE Card SET balance = %s WHERE cardId = %s", (amount, cardId))
	connecection.commit ()
	return 0

def get_cards_by_name (username):
	cursor.execute ("SELECT cardId FROM Card JOIN Client ON Card.clientId = Client.clientId WHERE Client.username = %s", username)
	return cursor.fetchall()

def update_group_balance(groupId, amount):
	return


# SELECT
def get_client_data(username):
	cursor.execute("SELECT * FROM 'Client' WHERE username = %s", (username))
	return cursor.fetchone()

def get_operation_data(username, dateFrom=""):
	return

def get_card_balance (cardId):
	cursor.execute ("SELECT balance FROM Card WHERE cardId = %s", cardId)
	return cursor.fetchone()	

def get_group_data (groupId):
	return


def get_groups (username):
	return

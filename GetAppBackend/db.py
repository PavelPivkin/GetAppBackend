from GetAppBackend import mysql

connection = mysql.connect()
cursor = connection.cursor()

# UPDATE
def update_card_balance (cardId, amount):
    cursor.execute ("UPDATE Card SET balance = %s WHERE cardId = %s", (amount, cardId))
    connection.commit ()
    return 0

def transfer (srcCardId, dstCardId, dstCardNumber, amount):
    try:
        cursor.execute (
            "UPDATE Card SET balance = balance - %s WHERE cardId = %s ",
            (amount, srcCardId)
        )
        cursor.execute (
            "UPDATE Card SET balance = balance + %s WHERE cardId = %s ",
            (amount, dstCardId))
        connection.commit()
        return 0
    except Exception, e:
        return 1
    

# SELECT
def get_client_data(username):
    e = cursor.execute("SELECT clientId, firstName, lastName, patronomyc, username FROM Client WHERE username = %s", username)
    return fetchOneAssoc(e)

def get_card (cardId):
    cursor.execute ("SELECT * FROM Card WHERE cardId = %s", cardId)
    return cursor.fetchone()    

def get_cards_by_name (username):
    e = cursor.execute (
        "SELECT cardId, Client.clientId, balance, holderName, paymentSystem, CardNumber FROM Card JOIN Client " + 
        "ON Card.clientId = Client.clientId WHERE Client.username = %s", (username)
    )
    return fetchAllAssoc (e)

def get_operations_data(username, toDate, fromDate="1000-0-0 00:00:00"):
    e = cursor.execute(
        "SELECT operationId, clientId, odate, type, amount, description FROM Operation JOIN Client ON Client.clientId = Operation.clientId" + 
        "WHERE Client.username = %s AND odate < %s AND odate >= %s ", 
        (username, fromDate, toDate)
    )
    return fetchOneAssoc(e)

def fetchOneAssoc(data):
    data = cursor.fetchone()
    if data == None:
        return None
    desc = cursor.description
    dictionary = {}
    for (name, value) in zip(desc, data):
        dictionary[name[0]] = value
    return dictionary

def fetchAllAssoc(data):
    data = cursor.fetchall()
    if data == None:
        return None
    li =[]   
    desc = cursor.description
    for (string) in (data):
        dictionary = {}
        for (name, value) in zip(desc, string):
            dictionary[name[0]] = value
        li.append(dictionary)
    return li
    
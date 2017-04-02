from GetAppBackend import app
from flask import request, session, make_response, jsonify
from flask_api import status
from time import gmtime, strftime
import db

@app.route('/login', methods=['POST'])
def login():
    client = db.get_client_data(request.headers.get('username'))
    if (client is not None):
        session['JSSESIONID'] = client['username']
        response = make_response()
        return response, status.HTTP_200_OK
    else:
        response = make_response()
        response.status = "User not found"
        return response, status.HTTP_401_UNAUTHORIZED

@app.route('/logout', methods=['POST'])
def logout():
    # remove the username from the session if it's there
    try:
        username = session["JSSESIONID"]
        if username is not None:
            session.pop(username, None)    
            response = make_response()
            return response, status.HTTP_200_OK
        else:
            response = make_response()
            return response, status.HTTP_401_UNAUTHORIZED
    except Exception, e:
        response = make_response()
        return response, status.HTTP_404_NOT_FOUND

# Get client data
@app.route('/client', methods=['GET'])
def client():
    try:
        username = session["JSSESIONID"]
        if username is not None:
            client = db.get_client_data(username)
            json = jsonify(client)
            return json, status.HTTP_200_OK
        else:
            response = make_response()
            return response, status.HTTP_401_UNAUTHORIZED
    except Exception, e:
        response = make_response()
        return response, status.HTTP_404_NOT_FOUND

# Get operation history
@app.route('/request', methods=['GET'])
def _request():
    try:
        username = session["JSSESIONID"]
        if username is not None:
            dates = request.get_json();
            toDate = dates["toDate"]
            fromDate = dates["fromDate"]
            if toDate is None:
                toDate = strftime("%Y-%m-%d %H:%M:%S", gmtime())
            operations = db.get_operation_data(username, toDate, fromDate)
            json = json_response(operations)
            return json, status.HTTP_200_OK
        else:
            response = make_response()
            return response, status.HTTP_401_UNAUTHORIZED
    except Exception, e:
        response = make_response()
        return response, status.HTTP_404_NOT_FOUND

# Transfer between cards
@app.route('/transfer/c2c', methods=['POST'])
def transfer_c2c():
    try:
        username = session['JSSESIONID']
        if username is not None:
            json_request = request.get_json()
            db.transfer (
                json_request["srcCardId"], 
                json_request["dstCardId"],
                json_request["dstCardNumber"],
                json_request["amount"]
            )
            card = db.get_card(username)
            json = jsonify(card)
            return json, status.HTTP_200_OK
        else:
            response = make_response()
            return response, status.HTTP_401_UNAUTHORIZED
    except Exception, e:
        response = make_response()
        return response, status.HTTP_404_NOT_FOUND

@app.route('/cards')
def get_cards():
    try:
        username = session["JSSESIONID"]
        if username is not None:
            cards = db.get_cards_by_name(username)
            json = jsonify(cards)
            return json, status.HTTP_200_OK
        else:
            response = make_response()
            return response, status.HTTP_401_UNAUTHORIZED
    except Exception, e:
        response = make_response()
        return response, status.HTTP_404_NOT_FOUND


# Sign operation with code (sms)
@app.route('/request/<requestId>/code/sign', methods=['POST'])
def request_code_sign():
    return

# Send confirmation code
@app.route('/request/<requestId>/code/send', methods=['POST'])
def request_code_send():
    return

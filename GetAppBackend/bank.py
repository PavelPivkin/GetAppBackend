from GetAppBackend import app
from flask import request, session, make_response
from flask.ext.api import status
import users
import os
import db

JSESSIONID_LENGTH = 32

@app.route('/login', methods=['POST'])
def login():
    print(users.data, request.headers)
    user = next(u for u in users.data if u['username'] == request.headers.get('username'))
    if (user is not None and user['password'] == request.headers['password']):
        sessionId = os.urandom(JSESSIONID_LENGTH)
        session['JSSESIONID'] = sessionId
        response = make_response()
        return response, status.HTTP_200_OK
    else:
        response = make_response()
        response.status = "User not found"
        return response, status.HTTP_401_UNAUTHORIZED

@app.route('/logout', methods=['POST'])
def logout():
    # remove the username from the session if it's there
    sessionId = request.cookies.get('JSSESIONID')
    session.pop(sessionId, None)    
    response = make_response()
    return response, status.HTTP_200_OK

    try:
        session.pop(request.headers['JSSESIONID'], None)

        response = make_response()
        return response, status.HTTP_200_OK
    except Exception, e:
        response = make_response()
        return response, status.HTTP_404_NOT_FOUND

# Get client data
@app.route('/client', methods=['GET'])
def client():
    try:
        response = make_response()
        response.set_data("")
        response.content_type = "application/json"
        return response, status.HTTP_200_OK
    except Exception, e:
        response = make_response()
        return response, status.HTTP_404_NOT_FOUND

# Get operation history
@app.route('/request', methods=['GET'])
def _request():
    try:
        response = make_response()
        response.set_data("")
        response.content_type = "application/json"
        return response, status.HTTP_200_OK
    except Exception, e:
        response = make_response()
        return response, status.HTTP_404_NOT_FOUND

# Transfer between cards
@app.route('/transfer/c2c', methods=['POST'])
def transfer_c2c():
    try:
        response = make_response()
        response.set_data("")
        response.content_type = "application/json"
        return response, status.HTTP_200_OK
    except Exception, e:
        response = make_response()
        return response, status.HTTP_404_NOT_FOUND

# Sign opperation with code (sms)
@app.route('/request/<requestId>/code/sign', methods=['POST'])
def request_code_sign():
    return

# Send confirmation code
@app.route('/request/<requestId>/code/send', methods=['POST'])
def request_code_send():
    return

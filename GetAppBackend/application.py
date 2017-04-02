from GetAppBackend import app
from flask import request, session, make_response
from flask.ext.api import status
import os
import db


transfer_list = []

@app.route ("/NFCdstCard")
def request_NFCdstCard():
	code = request.args.get("code")
	dstCardId = request.args.get("dstCardId")
	transfer_item = get_transfer_item(code)
	transfer_item["dstCardId"] = dstCardId
	return make_response(), status.HTTP_200_OK

	

@app.route ("/NFCsrcCard")
def request_NFCsrcCard():
	code = request.args.get("code")
	amount = request.args.get("amount")
	srcCardId = request.args.get("srcCardId")
	transfer_item = get_transfer_item(code)
	transfer_item["srcCardId"] = srcCardId
	transfer_item["amount"] = amount
	if transfer_item["dstCardId"] is not None:
		return make_response(), status.HTTP_200_OK
	return make_response(), status.HTTP_404_NOT_FOUND

@app.route ("/complete_transfer")
def complete_transfer():
	code = request.args.get("code")
	transfer_item = get_transfer_item(code)
	db.transfer(
		transfer_item["srcCardId"], 
		transfer_item["dstCardId"], 
		None, 
		transfer_item["amount"]
	)
	return make_response(), status.HTTP_200_OK

def get_transfer_item (code):
	transfer_item = next((x for x in transfer_list if x["code"] == code))
	if transfer_item is None:
		transfer_item = {
			"code": code,
			"dstCardId": None ,
			"srcCardId": None,
			"dstCardNumber": None,
			"amount": None
		}
		transfer_list.append(transfer_item)
	return transfer_item



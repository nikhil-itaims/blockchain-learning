from web3 import Web3, HTTPProvider
from dotenv import load_dotenv
import os
load_dotenv()

api_key = os.getenv('API_KEY')
account_id = os.getenv('ACCOUNT_ID')

w3 = Web3(HTTPProvider(f"https://sepolia.infura.io/v3/{api_key}"))

if w3.is_connected():
    balance = w3.eth.get_balance(account=account_id)
    print(w3.from_wei(balance, 'ether'))
    
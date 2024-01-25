from web3 import Web3, HTTPProvider
from dotenv import load_dotenv
import os
load_dotenv()

api_key = os.getenv('API_KEY')
from_account_id = os.getenv('ACCOUNT_ID')
to_account_id = os.getenv('TO_ACCOUNT_ID')
private_key_sender = os.getenv('PRIVATE_KEY_SENDER')

w3 = Web3(HTTPProvider(f"https://sepolia.infura.io/v3/{api_key}"))

if w3.is_connected():
    # Instantiate an Account object from your key:
    from_account = w3.eth.account.from_key(private_key_sender)
    # get nonce
    nonce = w3.eth.get_transaction_count(from_account_id)

    ether_val_in_wei = w3.to_wei(0.1, 'ether')

    # Build a new transaction
    transaction = {
        'from': from_account.address,
        'to': to_account_id,
        'value': ether_val_in_wei,
        'nonce': nonce
    }

    gas_estimate = w3.eth.estimate_gas(transaction)
    chain_id = w3.eth.chain_id
    transaction['chainId'] = chain_id
    transaction['gas'] = gas_estimate + 20000
    transaction['maxFeePerGas'] = w3.eth.gas_price
    transaction['maxPriorityFeePerGas'] = int(0.5 * transaction['maxFeePerGas'])

    # Sign transaction with a private key
    signed = w3.eth.account.sign_transaction(transaction, private_key_sender)

    # Send the signed transaction
    tx_hash = w3.eth.send_raw_transaction(signed.rawTransaction)
    tx = w3.eth.get_transaction(tx_hash)
    print('transaction details', tx)
    assert tx["from"] == from_account.address

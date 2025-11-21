from Crypto.PublicKey import RSA
from Crypto.Cipher import PKCS1_OAEP
import base64

def generate_keys():
    key = RSA.generate(2048)
    private_key = key.export_key()
    public_key = key.publickey().export_key()
    return private_key, public_key

def rsa_encrypt(plain_text, public_key):
    key = RSA.import_key(public_key)
    cipher = PKCS1_OAEP.new(key)
    cipher_text = cipher.encrypt(plain_text.encode('utf-8'))
    return base64.b64encode(cipher_text).decode('utf-8')

def rsa_decrypt(cipher_text, private_key):
    key = RSA.import_key(private_key)
    cipher = PKCS1_OAEP.new(key)
    plain_text = cipher.decrypt(base64.b64decode(cipher_text)).decode('utf-8')
    return plain_text
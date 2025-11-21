from Crypto.Cipher import AES
from Crypto.Random import get_random_bytes
import base64

def pad(text):
    while len(text) % 16 != 0:
        text += ' '
    return text

def aes_encrypt(plain_text, key):
    cipher = AES.new(key, AES.MODE_ECB)
    cipher_text = cipher.encrypt(pad(plain_text).encode('utf-8'))
    return base64.b64encode(cipher_text).decode('utf-8')

def aes_decrypt(cipher_text, key):
    cipher = AES.new(key, AES.MODE_ECB)
    plain_text = cipher.decrypt(base64.b64decode(cipher_text)).decode('utf-8').strip()
    return plain_text
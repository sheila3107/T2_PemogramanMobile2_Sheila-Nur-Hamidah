import time
from aes_encryption import aes_encrypt, aes_decrypt
from rsa_encryption import rsa_encrypt, rsa_decrypt, generate_keys
from Crypto.Random import get_random_bytes

def main():
    print("=== Implementasi Kriptografi AES dan RSA ===")
    text = input("Masukkan teks rahasia: ")

    # ===== AES =====
    aes_key = get_random_bytes(16)  # 128-bit key
    start = time.time()
    aes_cipher = aes_encrypt(text, aes_key)
    end = time.time()
    print("\n[AES] Ciphertext:", aes_cipher)
    print("[AES] Waktu enkripsi:", round(end - start, 6), "detik")

    start = time.time()
    aes_plain = aes_decrypt(aes_cipher, aes_key)
    end = time.time()
    print("[AES] Hasil dekripsi:", aes_plain)
    print("[AES] Waktu dekripsi:", round(end - start, 6), "detik")

    # ===== RSA =====
    private_key, public_key = generate_keys()
    start = time.time()
    rsa_cipher = rsa_encrypt(text, public_key)
    end = time.time()
    print("\n[RSA] Ciphertext:", rsa_cipher)
    print("[RSA] Waktu enkripsi:", round(end - start, 6), "detik")

    start = time.time()
    rsa_plain = rsa_decrypt(rsa_cipher, private_key)
    end = time.time()
    print("[RSA] Hasil dekripsi:", rsa_plain)
    print("[RSA] Waktu dekripsi:", round(end - start, 6), "detik")

    # ===== Perbandingan =====
    print("\n=== Perbandingan ===")
    print(f"Ukuran Ciphertext AES: {len(aes_cipher)} karakter")
    print(f"Ukuran Ciphertext RSA: {len(rsa_cipher)} karakter")

if __name__ == "__main__":
    main()
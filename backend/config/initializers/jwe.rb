require "jose"
require "json"
require "base64"
require "openssl"


def derive_encryption_key(hash_algo, key_material, salt, info, length)
  OpenSSL::KDF.hkdf(key_material,
                    salt: salt,
                    info: info,
                    length: length,
                    hash: hash_algo)
end


AUTH_SECRET = ENV["AUTH_SECRET"]

unless AUTH_SECRET.present?
  raise "AUTH_SECRET environment variable is missing!"
end


salt = ENV["NEXT_PUBLIC_AUTHJS_SESSION_COOKIE"]
info = "Auth.js Generated Encryption Key (#{salt})"
length = 64

derived_key = derive_encryption_key("sha256", AUTH_SECRET, salt, info, length)


JWK_OCT512 = JOSE::JWK.from_oct(derived_key)

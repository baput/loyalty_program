class User < ApplicationRecord
    has_secure_password
    has_many :points
    def encode_token(payload)
        JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end
    def decode_token(token)
        JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
    end
end


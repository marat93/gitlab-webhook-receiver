class User
    include ActiveModel::SecurePassword

    attr_accessor :username

    has_secure_password

    def password_digest
        @password_digest ||= BCrypt::Password.create('password')
    end
end
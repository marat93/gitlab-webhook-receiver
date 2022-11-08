class User
    attr_accessor :username

    def username
        @username ||= 'mitosinka'
    end

    def authenticate(password_hash)
        password_hash == Digest::SHA1.hexdigest('milan')
    end
end
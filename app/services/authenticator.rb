class Authenticator
  class AuthenticationError < StandardError; end

  def authenticate(options)
    if ((email = options[:email]) && (password = options[:password]))
      authenticate_by_email_and_password(email, password)
    else
     fail ArgumentError.new("Invalid authentication arguments")
    end
  end

  def authenticate_by_email_and_password(email, password)
    user = User.find_for_database_authentication(email: email)

    return user if user && user.valid_password?(password)

    fail AuthenticationError.new("Invalid email/password")
  end
end

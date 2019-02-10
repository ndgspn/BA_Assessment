module Authentication
  module Create
    def self.call(params)
      email    = params[:email]
      password = params[:password]

      user = User.find_by_email(email: email)
      if user && user.authenticate(password: password)
        return true
      else
        return false
      end
    end
  end
end

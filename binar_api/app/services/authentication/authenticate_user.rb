module Authentication
  class AuthenticateUser

    def initialize(params)
      @email    = params[:email]
      @password = params[:password]
    end

    def call
      JsonWebToken.encode(user_id: user.id) if user
    end

    private
    attr_accessor :email, :password

    def user
      user = User.find_by_email(email)
      return user if user && user.authenticate(password)
    end
  end
end

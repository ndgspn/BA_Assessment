module Login
  module Create
    def self.call(params)
      uri = 'https://test-binar.herokuapp.com/auth/login'
      values = {
        "email": params[:email],
        "password": params[:password]
      }
      RestClient.post uri, values.to_json
    end
  end
end

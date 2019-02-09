module Signup
  module Create
    def self.call(params)
      uri = 'https://test-binar.herokuapp.com/auth/signup'
      values = {
        "name": params[:name],
        "email": params[:email],
        "password": params[:password]
      }
      RestClient.post uri, values.to_json
    end
  end
end

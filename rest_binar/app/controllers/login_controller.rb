class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    response = ::Login::Create.call(params)
    render json: response
  end

end

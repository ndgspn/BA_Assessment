class SignupController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    response = ::Signup::Create.call(params)
    render plain: response
  end
end

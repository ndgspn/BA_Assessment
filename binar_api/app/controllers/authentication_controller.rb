class AuthenticationController < ApplicationController
  def create
    user = ::Authentication::AuthenticateUser.new(params).call
    return render json: { status: :OK, result: { access_token: user } } if user
    render json: { error: 'invalid credential' }, status: :unauthorized
  end
end

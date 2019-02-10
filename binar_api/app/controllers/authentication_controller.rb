class AuthenticationController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: {
        status: :OK,
        result: {
          access_token: token
        },
        errors: user.errors.full_messages },
        status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end

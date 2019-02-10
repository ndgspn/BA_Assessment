class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    return render json: { status: :OK, result: user, errors: user.errors.full_messages }, status: :OK if user.save
    render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end

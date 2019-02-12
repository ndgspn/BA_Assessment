class ApplicationController < ActionController::API

  private

  def authorize_request
    @user = ::Authentication::AuthorizeRequest.new(request.headers).call
  rescue ActiveRecord::RecordNotFound => e
    render json: { errors: e.message, user: @user }, status: :unauthorized
  rescue JWT::DecodeError => e
    render json: { errors: e.message }, status: :unauthorized
  end
end

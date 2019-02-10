module Api::V2
  class ProductsController < ApiController
    before_action :authorize_request

    def index
      render json: { message: 'Hello there :)' }
    end
  end
end

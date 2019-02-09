module Api::V2
  class ProductsController < ApiController
    skip_before_action :verify_authenticity_token

    def index
      products = RestClient.get product_uri, authorize
      render json: products
    end
  end
end

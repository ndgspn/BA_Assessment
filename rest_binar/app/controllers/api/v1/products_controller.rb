module Api::V1
  class ProductsController < ApiController
    skip_before_action :verify_authenticity_token

    def index
      products = RestClient.get product_uri, authorize
      render json: products
    end

    def show
      product = RestClient.get product_uri+"/"+"#{product_id}", authorize
      render json: product
    end

    def create
      product = RestClient.post product_uri, product_params.to_json, authorize
      render json: product
    end

    def destroy
      product = RestClient.delete product_uri+"/"+"#{product_id}", authorize
      render json: product
    end

  end
end

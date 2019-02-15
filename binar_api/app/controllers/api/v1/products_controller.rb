module Api::V1
  class ProductsController < ApiController
    before_action :authorize_request
    before_action :product_id, only: [:show, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :product_not_found

    def index
      @product = Product.ordered
      render json: { status: :OK, result: @product }
    end

    def show
      return response_success if @product
    end

    def create
      @product = Product.new(product_params)
      return response_success if @product.save
      response_error
    end

    def update
      return response_success if @product.update(product_params)
      response_error
    end

    def destroy
      return response_deleted if @product.destroy
    end

    private
    def product_params
      params.permit(:name, :price, :imageurl)
    end

    def product_id
      @product = Product.product_id(params)
    end
  end
end

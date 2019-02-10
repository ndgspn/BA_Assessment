module Api::V1
  class ProductsController < ApiController
    before_action :authorize_request

    def index
      @product = Product.ordered
      render json: { status: :OK, result: @product }
    end

    def show
      begin
        @product = Product.product_id(params)
        return response_success if @product
      rescue ActiveRecord::RecordNotFound
        render json: { errors: "Couldn't find product with id: #{params[:id]}" }
      end
    end

    def create
      @product = Product.new(product_params)
      return response_success if @product.save
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end

    def update
      @product = Product.product_id(params)
      return response_success if @product.update(product_params)
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end

    def destroy
      @product = Product.product_id(params)
      return response_deleted if @product.destroy
    end

    private
    def product_params
      params.permit(:name, :price, :imageurl)
    end
  end
end

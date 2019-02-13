module Api::V1
  class ProductsController < ApiController
    before_action :authorize_request
    rescue_from ActiveRecord::RecordNotFound, with: :product_not_found

    def index
      @product = Product.ordered
      render json: { status: :OK, result: @product }
    end

    def show
<<<<<<< HEAD
        @product = Product.product_id(params)
        return response_success if @product
=======
      @product = Product.product_id(params)
      return response_success if @product
    rescue ActiveRecord::RecordNotFound
      render json: { errors: "Couldn't find product with id: #{params[:id]}" }
>>>>>>> fa5907b9426096edaba12e484f19c2ef6d31c2e2
    end

    def create
      @product = Product.new(product_params)
      return response_success if @product.save
      response_error
    end

    def update
      @product = Product.product_id(params)
      return response_success if @product.update(product_params)
      response_error
    end

    def destroy
      @product = Product.product_id(params)
      return response_deleted if @product.destroy
    end

    private
    def product_params
      params.permit(:name, :price, :imageurl)
    end

    def response_success
      render json: { status: :OK, result: @product }
    end

    def response_deleted
      render json: { status: :OK, result: { message: "product with id: #{params[:id]} successfully deleted" } }
    end

    def response_error
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end

    def product_not_found
      render json: { errors: "Couldn't find product with id: #{params[:id]}" }
    end
  end
end

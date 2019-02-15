module Api::V1
  class ApiController < ApplicationController
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

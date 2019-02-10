module Api::V1
  class ApiController < ApplicationController
    def response_success
      render json: {
        status: :OK,
        result: @product
      }
    end

    def response_deleted
      render json: {
        status: :OK,
        result: {
          message: "product with id: #{params[:id]} successfully deleted"
        }
      }
    end

  end
end

module Api::V2
  class ApiController < ApplicationController
    def authorize
      {
        :authorization => 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NDk3NjczNjd9.dklVJPxDmnuEiO1O3Z8RWXhB7SQ0YipsDgzPJO5HeCs'
      }
    end

    def product_uri
      'https://test-binar.herokuapp.com/v2/products'
    end

    def product_params
      {
        "name": params[:name],
        "price": params[:price],
        "imageurl": params[:imageurl]
      }
    end

    def product_id
      params[:id]
    end
  end
end

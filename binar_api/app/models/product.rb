class Product < ApplicationRecord
  validates :name,     presence: true
  validates :price,    presence: true
  validates :imageurl, presence: true

  def self.ordered
    order(id: :desc)
  end

  def self.product_id(params)
    find(params[:id])
  end
end

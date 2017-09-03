class ShippingOption < ApplicationRecord
  has_many :products, through: :product_shipping_options
  has_many :orders

  validates_presence_of :name, :price
end

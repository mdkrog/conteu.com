class ProductShippingOption < ApplicationRecord
  belongs_to :product
  belongs_to :shipping_option
end

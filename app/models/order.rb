class Order < ApplicationRecord
  extend FriendlyId
  friendly_id :order_number

  before_create :generate_random_id
  has_many :order_items
  belongs_to :shipping_option

  enum status: { pending: 0, paid: 1, failed: 2, dispatched: 3, delivered: 4 }

  def total_price
    order_items.inject(0) { |sum, item| sum + item.total_price }
  end

  def total_price_incl_shipping
    total_price + shipping_price
  end

  def shipping_price
    if country == "ZA"
      54
    else
      250
    end
  end

  validates_presence_of :name, :email, :address, :phone, :city, :country, :postal_code

  private

  def generate_random_id
    self.order_number = SecureRandom.hex(8)
  end
end

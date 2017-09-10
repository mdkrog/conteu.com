class Order < ApplicationRecord
  extend FriendlyId
  friendly_id :order_number

  before_create :generate_random_id
  has_many :order_items

  enum status: { pending: 0, paid: 1, failed: 2, dispatched: 3, delivered: 4 }
  enum shipping_option: { collection_durban: 0, local: 1, international: 2 }

  def total_price
    order_items.inject(0) { |sum, item| sum + item.total_price }
  end

  def total_price_incl_shipping
    total_price + shipping_price
  end

  def shipping_price
    if fixed_shipping_price == -1
      self.update(fixed_shipping_price: calculated_shipping_price)
    end
    fixed_shipping_price
  end

  def calculated_shipping_price
    products = order_items.map { |item| item.product }
    price = 0
    if shipping_option == 'local'
      price = products.max_by(&:local_shipping_price).try(:local_shipping_price)
    elsif shipping_option == 'international'
      price = products.max_by(&:international_shipping_price).try(:international_shipping_price)
    end
    price
  end

  validates_presence_of :name, :email, :address, :phone, :city, :country, :postal_code, :fixed_shipping_price, :shipping_option

  private

  def generate_random_id
    self.order_number = SecureRandom.hex(8)
  end
end

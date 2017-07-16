class Order < ApplicationRecord
  extend FriendlyId
  friendly_id :order_number

  before_create :generate_random_id
  has_many :order_items

  enum status: { pending: 0, paid: 1, failed: 2, dispatched: 3, delivered: 4 }

  def total_price
    order_items.inject(0) { |sum, item| sum + item.total_price }
  end

  # STATES = [
  #   [ "New", :new ],
  #   [ "Dispatched", :dispatched ]
  # ]

  validates_presence_of :name, :email, :address, :phone, :city, :country, :postal_code

  private

  def generate_random_id
    self.order_number = SecureRandom.hex(8)
  end
end

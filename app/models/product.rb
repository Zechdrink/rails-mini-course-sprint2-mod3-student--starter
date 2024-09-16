class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products

  # scope :in_stock, -> (order_id) { find(order_id).products.where("inventory > ?", 0).product(:cost) }

  validates :cost_cents, presence: true, numericality: { only_integer: true, greater_than: 0}
  validates :inventory, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :name, presence: true

  def available?
    inventory > 0
  end

  def reduce_inventory
    update(inventory: inventory - 1)
  end
end

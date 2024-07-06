# frozen_string_literal: true

# Repository class to retrieve products
# At this moment this will work just with an in memory array of products
class ProductRepository
  PRODUCTS = [
    Product.new('GR1', 'Green Tea', 3.11),
    Product.new('SR1', 'Strawberries', 5.00),
    Product.new('CF1', 'Coffee', 11.23)
  ].freeze

  def find(id)
    PRODUCTS.find { |product| product.id == id }
  end

  def all
    PRODUCTS
  end
end

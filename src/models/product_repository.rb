# frozen_string_literal: true

# Repository class to retrieve products
# At this moment this will work just with an in memory array of products
class ProductRepository
  def find(id)
    products.find { |product| product.id == id }
  end

  def all
    products
  end

  private

  def products
    @products ||= read_products_from_config
  end

  def read_products_from_config
    products = YAML.load_file('src/configuration.yml')['products']
    products.map do |product|
      Product.new(product['code'], product['name'], product['price'])
    end
  end
end

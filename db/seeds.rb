# i = 0
# j = 1
#
# while i < 676 do
#  Product.create(id: j, title: Faker::Games::Pokemon.#name, price: Faker::Commerce.price(range: 0.25..99.#9), stock_quantity: Faker::Number.number(digits: #2))
#  i += 1
#  j += 1
# end

require "csv"

Category.destroy_all
Product.destroy_all

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)
products = CSV.parse(csv_data, headers: true)

products.each do |product|
  category_name = product['category']
  category = Category.find_or_create_by(name: category_name)
  Product.create(title: product['title'], price: product['price'], stock_quantity: product['stock_quantity'], category_id: category.id)
end

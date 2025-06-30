i = 0
j = 1

while i < 676 do
  Product.create(id: j, title: Faker::Games::Pokemon.name, price: Faker::Commerce.price(range: 0.25..99.9), stock_quantity: Faker::Number.number(digits: 2))
  i += 1
  j += 1
end

require_relative 'product'
require_relative 'shopping_cart_helper'
require_relative 'data'

# Products index:
def display_products(products)
  string = ""
  products.each_with_index do |product, i|
    string += "Product #{i + 1}: #{product.full_description}\n\n"
  end
  string
end

cart = []

puts "Here are the available products:"
puts "____________________________________\n\n"

puts display_products(PRODUCTS)
puts "____________________________________\n\n"

loop do
  # Ask which product to buy or quit
  puts 'What do you want to buy? (Enter product N° or q to finish)'
  product_index = gets.chomp.downcase

  # break loop if quit
  break if product_index == 'q'

  if (product_index.to_i - 1).between?(0, PRODUCTS.length)
    # Assuming any stock availability. In a web interface we would show a dropdown with valid quantities.
    puts 'How many? (Enter a number)'
    quantity = gets.chomp.downcase
    loop do
      if quantity.match(/^(\d)+$/) # Check if number
        ShoppingCartHelper.add_to_cart(cart, PRODUCTS[(product_index.to_i - 1)], quantity.to_i)
        break
      else
        puts 'How many? (Please enter a valid integer)'
        quantity = gets.chomp.downcase
      end
    end
  else
    # Otherwise show error
    puts "We don't have any in store, sorry!"
  end
end

# Display content of basket & total price
puts "\n\n"
puts 'Here is your order:'
puts "____________________________________\n\n"

puts ShoppingCartHelper.cart_to_s(cart)
puts "____________________________________\n\n"

puts "Total taxes: $#{ShoppingCartHelper.cart_tax(cart).round(2)}"

puts "Total price: $#{(ShoppingCartHelper.cart_price(cart) + ShoppingCartHelper.cart_tax(cart)).round(2)}"
puts "\n\n"

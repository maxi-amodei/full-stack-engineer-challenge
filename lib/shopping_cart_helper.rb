# This file contains methods related to your shopping cart.

module ShoppingCartHelper
  def self.add_to_cart(cart, product, quantity)
    cart << [product, quantity]
  end

  def self.cart_to_s(cart)
    cart.map { |order| "#{order[1]} - #{order[0].full_description}" }.join("\n")
  end

  def self.cart_price(cart)
    total = 0
    cart.each do |order|
      product = order[0]
      quantity = order[1]
      total += (quantity * product.price)
    end
    total
  end

  def self.cart_tax(cart)
    total = 0
    cart.each do |order|
      product = order[0]
      quantity = order[1]
      total += (quantity * product.tax_amount)
    end
    total
  end
end

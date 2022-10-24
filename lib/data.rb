# frozen_string_literal: true

require_relative 'product'

PRODUCTS = [
  Product.new(name: 'Book', price: 12.49, origin: 'national', category:'book'),
  Product.new(name: 'CD', price: 14.99, origin: 'national', category: 'entertainment'),
  Product.new(name: 'Chocolate', price: 0.85, origin: 'national', category:'food'),
  Product.new(name: 'Chocolate box', price: 10.0, origin: 'imported', category:'food'),
  Product.new(name: 'Perfume', price: 47.50, origin: 'imported', category: 'personal care'),
  Product.new(name: 'Perfume', price: 27.99, origin: 'imported', category: 'personal care'),
  Product.new(name: 'Perfume', price: 18.99, origin: 'national', category: 'personal care'),
  Product.new(name: 'Pills', price: 9.75, origin: 'national', category: 'medical'),
  Product.new(name: 'Chocolate box', price: 11.25, origin: 'imported', category: 'food')
]

# To test exercise input products:
INPUT_1 = [
  PRODUCTS[0],
  PRODUCTS[0],
  PRODUCTS[1],
  PRODUCTS[2],
]

INPUT_2 = [
  PRODUCTS[3],
  PRODUCTS[4],
]

INPUT_3 = [
  PRODUCTS[5],
  PRODUCTS[6],
  PRODUCTS[7],
  PRODUCTS[8],
  PRODUCTS[8],
  PRODUCTS[8],
]

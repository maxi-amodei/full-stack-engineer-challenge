# frozen_string_literal: true

# This file contains Product class to handle pricing logic.

class Product
  attr_reader :name, :category, :origin, :price

  EXEMPTED_CATEGORIES = ['book', 'food', 'medical'].freeze
  ROUNDING = 0.05
  SALES_TAX = 10
  IMPORT_TAX = 5

  def initialize(args = {})
    @name = args[:name]
    @category = args[:category]
    @origin = args[:origin]
    @price = args[:price]
  end

  def tax_amount
    total = 0
    unless EXEMPTED_CATEGORIES.include?(@category)
      total += round_up(SALES_TAX * @price / 100)
    end

    if @origin == 'imported'
      total += round_up(IMPORT_TAX * @price / 100 )
    end
    total
  end

  def full_description
    "#{@name.capitalize} - #{@origin.capitalize} - $#{@price}"
  end

  private

  def round_up(value)
    (value * (1 / ROUNDING)).ceil / (1 / ROUNDING)
  end
end

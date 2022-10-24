require 'rspec'
require_relative '../lib/data'

# Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. 
# Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

# The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the 
# nearest 0.05) amount of sales tax

SALES_TAX = 10
IMPORT_TAX = 5
ROUNDING = 0.05

describe 'Products' do
  it 'correctly takes the sales tax for a national exempted category (books, food, and medical) product' do
    food_product = PRODUCTS[2]
    medical_product = PRODUCTS[7]

    sales_tax_1 = food_product.tax_amount
    sales_tax_2 = medical_product.tax_amount

    expect(sales_tax_1.round(2)).to eq(0)
    expect(sales_tax_2.round(2)).to eq(0)
  end

  it 'correctly takes the sales tax for an imported exempted category product' do
    product = PRODUCTS[8]
    sales_taxes = product.tax_amount

    import_tax_value = product.price * (IMPORT_TAX / 100.0)
    rounded_up_value = (import_tax_value * 1 / ROUNDING).ceil / (1 / ROUNDING)

    expect(sales_taxes.round(2)).to eq(rounded_up_value)
  end

  it 'correctly takes the sales tax for a regular product' do
    product = PRODUCTS[1]
    sales_taxes = product.tax_amount

    sales_tax_value = product.price * (SALES_TAX / 100.0)
    rounded_up_value = (sales_tax_value * 1 / ROUNDING).ceil / (1 / ROUNDING)

    expect(sales_taxes.round(2)).to eq(rounded_up_value)
  end

  it 'correctly takes the sales tax for a regular imported product' do
    product = PRODUCTS[5]
    sales_taxes = product.tax_amount

    import_tax_value = product.price * ((IMPORT_TAX + SALES_TAX) / 100.0)
    rounded_up_value = (import_tax_value * 1 / ROUNDING).ceil / (1 / ROUNDING)

    expect(sales_taxes.round(2)).to eq(rounded_up_value)
  end

  it 'correctly takes the total tax and total basket price for INPUT_1 list of products' do
    sales_taxes = 0
    total_price = 0

    INPUT_1.each do |product|
      sales_taxes += product.tax_amount
      total_price += product.price
    end

    total = sales_taxes + total_price

    expect(sales_taxes).to eq(1.5)
    expect(total).to eq(42.32)
  end

  it 'correctly takes the total tax and and total basket price for INPUT_2 list of products' do
    sales_taxes = 0
    total_price = 0

    INPUT_2.each do |product|
      sales_taxes += product.tax_amount
      total_price += product.price
    end

    total = sales_taxes + total_price

    expect(sales_taxes).to eq(7.65)
    expect(total).to eq(65.15)
  end

  it 'correctly takes the total tax and and total basket price for INPUT_3 list of products' do
    sales_taxes = 0
    total_price = 0

    INPUT_3.each do |product|
      sales_taxes += product.tax_amount
      total_price += product.price
    end

    total = sales_taxes + total_price

    expect(sales_taxes.round(2)).to eq(7.90)
    expect(total.round(2)).to eq(98.38)
  end
end

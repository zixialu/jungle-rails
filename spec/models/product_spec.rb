require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be valid for a Product with all values' do
      @category = Category.find_or_create_by! name: 'Toys'
      @product = @category.products.create!(
        name: "Slinky",
        price: 10099,
        quantity: 69
      )

      expect(@product.errors.full_messages).to be_empty
    end

    it 'should be invalid for a product missing a name' do
      @category = Category.find_or_create_by! name: 'Toys'
      @product = Product.new(
        name: '',
        price: 10099,
        quantity: 69,
        category_id: @category.id
      )

      @product.valid?

      expect(@product.errors[:name]).to include("can't be blank")
    end

    it 'should be invalid for a product missing a price' do
      @category = Category.find_or_create_by! name: 'Toys'
      @product = Product.new(
        name: 'Slinky',
        price: nil,
        quantity: 69,
        category_id: @category.id
      )

      @product.valid?

      expect(@product.errors[:price]).to include("can't be blank")
    end

    it 'should be invalid for a product missing a quantity' do
      @category = Category.find_or_create_by! name: 'Toys'
      @product = Product.new(
        name: 'Slinky',
        price: 10099,
        quantity: nil,
        category_id: @category.id
      )

      @product.valid?

      expect(@product.errors[:quantity]).to include("can't be blank")
    end

    it 'should be invalid for a product missing a category' do
      @category = Category.find_or_create_by! name: 'Toys'
      @product = Product.new(
        name: 'Slinky',
        price: 10099,
        quantity: 69,
        category_id: nil
      )

      @product.valid?

      expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end

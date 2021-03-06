require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "Saves when all field set (name, price, qty, category)" do
      @category = Category.create(name: "rocks")
      
      @product = Product.create(
        name: 'pet rock',
        price: 100,
        quantity: 1,
        category_id: 1,
      )

      expect(@product).to be_present
    end

    it "Warning on save when name not set" do
      @category = Category.create(id: 1)
      
      @product = Product.create(
        name: nil,
        price: 100,
        quantity: 1,
        category_id: 1,
      )

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "Warning on save when price not set)" do
      @category = Category.create(id: 1)
      
      @product = Product.create(
        name: 'pet rock',
        price: nil,
        quantity: 1,
        category_id: 1,
      )

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "Warning on save when quantity not set)" do
      @category = Category.create(id: 1)
      
      @product = Product.create(
        name: 'pet rock',
        price: 100,
        quantity: nil,
        category_id: 1,
      )

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "Doesn't save when category not set)" do
      @category = Category.create(id: 1)
      
      @product = Product.create(
        name: 'pet rock',
        price: 100,
        quantity: 1,
        category_id: nil,
      )

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
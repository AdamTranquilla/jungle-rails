require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP (initialize fake DB)
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 69.69
      )
    end
  end

  scenario "They nav from home to products where they see all products" do
    # ACT
    visit root_path
    first('.product > header > a').click
    # DEBUG
    
    # VERIFY
    expect(page).to have_css 'article.product', count: 10
    save_screenshot
  end
end
require 'rails_helper'

RSpec.feature "Visitor adds one item to cart", type: :feature, js: true do

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

  scenario "They see cart quantity update" do
    # ACT
    visit root_path
    first('.product > footer > form').click
    # DEBUG
    # save_screenshot
    
    # VERIFY
    expect(page).to have_content 'My Cart (1)'
  end
end
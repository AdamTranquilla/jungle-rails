require 'rails_helper'

RSpec.feature "User can Login with existing user info", type: :feature, js: true do

  # SETUP (initialize fake DB)
  before :each do
    @user = User.create!(
      first_name: 'Curious',
      last_name: 'George',
      email: 'curiousgeorge@gmail.com',
      password: 'bananana',
      password_confirmation: 'bananana'
    )
  end

  scenario "They are sent back to home where they see there first name in navbar" do
    visit '/login'

    fill_in 'email', with: 'curiousgeorge@gmail.com'
    fill_in 'password', with: 'bananana'
    find('input[type="submit"]').click 

    expect(page).to have_current_path('/')
    expect(page).to have_content 'Logout'
  end
end
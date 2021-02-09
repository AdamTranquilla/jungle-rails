require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'saves when when all fields set (first_name, last_name, email, pw, pw_conf)' do
      @user = User.create(
        first_name: 'Bob',
        last_name: 'Builder',
        email: 'bobthebuilder@gmail.com',
        password: 'abcdefgh',
        password_confirmation: 'abcdefgh'
      )

      expect(@user.id).to be_present
    end

    it 'Warning on save when first_name field nil' do
      @user = User.create(
        first_name: nil,
        last_name: 'Builder',
        email: 'bobthebuilder@gmail.com',
        password: 'abcdefgh',
        password_confirmation: 'abcdefgh'
      )

      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'Warning on save when last_name field nil' do
      @user = User.create(
        first_name: 'Bob',
        last_name: nil,
        email: 'bobthebuilder@gmail.com',
        password: 'abcdefgh',
        password_confirmation: 'abcdefgh'
      )

      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'Warning on save when email field nil' do
      @user = User.create(
        first_name: 'Bob',
        last_name: 'Builder',
        email: nil,
        password: 'abcdefgh',
        password_confirmation: 'abcdefgh'
      )

      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'Warning on save when password field nil' do
      @user = User.create(
        first_name: 'Bob',
        last_name: 'Builder',
        email: 'bobthebuilder@gmail.com',
        password: nil,
        password_confirmation: 'abcdefgh'
      )

      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'Warning on save when password confirmation field nil' do
      @user = User.create(
        first_name: 'Bob',
        last_name: 'Builder',
        email: 'bobthebuilder@gmail.com',
        password: 'abcdefgh',
        password_confirmation: nil )

      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'Warning on save when password != password_confirmation' do
      @user = User.create(
        first_name: 'Bob',
        last_name: 'Builder',
        email: 'bobthebuilder@gmail.com',
        password: 'abcdefgh',
        password_confirmation: 'abcdefghz'
      )

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'Warning on save when email exists in db' do
      @user_1 = User.create(
        first_name: 'Bob',
        last_name: 'Builder',
        email: 'bobthebuilder@gmail.com',
        password: 'abcdefgh',
        password_confirmation: 'abcdefgh'
      )
      @user_1.save!

      @user_2 = User.create(
        first_name: 'George',
        last_name: 'Curious',
        email: 'bobthebuilder@gmail.com',
        password: 'bananana',
        password_confirmation: 'bananana'
      )
      @user_2.save

      expect(@user_2.errors.full_messages).to include("Email already exists in database")
    end

    it 'Warning on save when password < than 8 char' do
      @user = User.create(
        first_name: 'Bob',
        last_name: 'Builder',
        email: 'bobthebuilder@gmail.com',
        password: 'abcdefg',
        password_confirmation: 'abcdefg'
      )

      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
  end

  describe '.authenticate-with-credentials' do
    it 'authentication with correct email and password' do
      @user = User.create(
        first_name: 'Bob',
        last_name: 'Builder',
        email: 'bobthebuilder@gmail.com',
        password: 'abcdefgh',
        password_confirmation: 'abcdefgh'
      )

      expect(User.authenticate_with_credentials('bobthebuilder@gmail.com', 'abcdefgh')).to be_truthy
    end

    it 'No authentication when email does not match' do
      @user = User.create(
        first_name: 'Bob',
        last_name: 'Builder',
        email: 'bobthebuilder@gmail.com',
        password: 'abcdefgh',
        password_confirmation: 'abcdefgh'
      )

      expect(User.authenticate_with_credentials('curiousgeorge@gmail.com', 'abcdefgh')).to be_falsey
    end

    it 'No authentication when password != password_confirmation' do
      @user = User.create(
        first_name: 'Bob',
        last_name: 'Builder',
        email: 'bobthebuilder@gmail.com',
        password: 'abcdefgh',
        password_confirmation: 'abcdefgz'
      )

      expect(User.authenticate_with_credentials('bobthebuilder@gmail.com', 'abcdefgh')).to be_falsey
    end

    it 'authenticates with email whitespace' do
      @user = User.create(
        first_name: 'Bob',
        last_name: 'Builder',
        email: 'bobthebuilder@gmail.com',
        password: 'abcdefgh',
        password_confirmation: 'abcdefgh'
      )

      expect(User.authenticate_with_credentials(' bobthebuilder@gmail.com ', 'abcdefgh')).to be_truthy
    end

    it 'authenticates case insensitive emails' do
      @user = User.create(
        first_name: 'Bob',
        last_name: 'Builder',
        email: 'bobthebuilder@gmail.com',
        password: 'abcdefgh',
        password_confirmation: 'abcdefgh'
      )

      expect(User.authenticate_with_credentials('bOBtHeBuiLdEr@gmAil.CoM', 'abcdefgh')).to be_truthy
    end
  end
end 
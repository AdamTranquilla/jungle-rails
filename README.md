# Jungle

Jungle is a mini e-commerce application built with Rails 4.2. The project's goal was to learn Rails by simulating work tickets on an existing codebase. 

## Fixes/Tickets
* Bug fixes (currency format consistency, cart and order details content missing)
* Additional Functionality (Sold-out badge, Admin security, Admin privileges, User login authentication, Seasonal sales)
* Rspec testing with Capybara and Poltergeist (User login, User paths from home to checkout, admin paths to change content)

## Stack
* Front-End: ERB, SCSS
* Back-End: Ruby on Rails, PSQL
* Testing: Rspec, Capybara, Poltergiest

## Screenshots
!["Home"](https://github.com/AdamTranquilla/jungle-rails/blob/master/app/assets/images/Jungle-home.png?raw=true)
!["Logged in and Filtered Categories"](https://github.com/AdamTranquilla/jungle-rails/blob/master/app/assets/images/Jungle-loggedin-categoryfiltered.png?raw=true)
!["Poduct Details"](https://github.com/AdamTranquilla/jungle-rails/blob/master/app/assets/images/Jungle-product-details.png?raw=true)
!["Stripe"](https://github.com/AdamTranquilla/jungle-rails/blob/master/app/assets/images/Jungle-stripe-cart.png?raw=true)
!["Order Details"](https://github.com/AdamTranquilla/jungle-rails/blob/master/app/assets/images/Jungle-order-details.png?raw=true)
!["Admin Functionality After Authentication"](https://github.com/AdamTranquilla/jungle-rails/blob/master/app/assets/images/Jungle-adminfunc-afterlogin.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

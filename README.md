# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.
 
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
 


## capybara and poltergeist Testing

Built-in [Capybara](https://teamcapybara.github.io/capybara/) test coverage.

!["capybara test for product-list-login-and adding products to cart"](https://github.com/LAYTHJABBAR/jungle-rails/blob/master/docs/admin-Dashboard.png?raw=true),


## App Specification
### Feature: Sold Out Badge
* When a product has 0 quantity, a sold out badge should be displayed on the product list page
* Should ideally be implemented as a question/boolean method in view helper and/or Product model
### Feature: Admin Categories
* Admin users can list and create new categories
* Admins can add new products using the new category
* Restful routes (resources) should be used, and there should be no extra, unused routes exposed
### Feature: User Authentication
* As a Visitor I can go to the registration page from any page in order to create an account
* As a Visitor I can sign up for a user account with my e-mail, password, first name and last name
* As a Visitor I can sign in using my e-mail and password
* As a User I can log out from any page
* As a User I cannot sign up with an existing e-mail address (uniqueness validation)
* Passwords are not stored as plain text in the database. Instead, has_secure_password is used in the User  
* login Authentication for Admin Drop List
!["login Authentication for Admin Drop List"](https://github.com/LAYTHJABBAR/jungle-rails/blob/master/docs/adminlogin.png?raw=true)
* Ability to add a new categories and productes to the lists by admin
!["Ability to add a new categories and productes to the lists by admin"](https://github.com/LAYTHJABBAR/jungle-rails/blob/master/docs/new_product.png?raw=true)
* sold add tag to the top of the products if there is no more items on the store
!["sold-out tag to the top of the products if there is no more items on the store"](https://github.com/LAYTHJABBAR/jungle-rails/blob/master/docs/sold_out_tag.png?raw=true)
## Dependencies
please be sure to have them installed before running the app.
Install dependencies with `bundle install`.


 

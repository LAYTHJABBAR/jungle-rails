require "rails_helper"

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: "Apparel"

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset("apparel1.jpg"),
        quantity: 10,
        price: 64.99,
      )
    end
  end
  scenario "They see all products" do
    visit root_path

    first("article.product").find_link("Details").click
    save_screenshot("products_Details_list.png")
    expect(page).to have_css ".products-show"
  end
end

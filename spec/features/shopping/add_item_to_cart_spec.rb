require "rails_helper"

describe "shopping", type: :feature, js: true do
  it "opens the cart after an order is added" do
    sku = create(:sku)

    visit product_path(sku.product)

    expect(page).to have_content("A Product Name")
    find(".email-opt-in").trigger("click")

    click_button("Add To Cart")

    # will error if it doesnt exist
    find(".js-cart.is-visible")
  end
end

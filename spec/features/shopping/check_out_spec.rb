require "rails_helper"

describe "shopping", type: :feature, js: true do
  it "should be able to make a purchase" do
    sku = create(:sku)

    visit product_path(sku.product)

    expect(page).to have_content("A Product Name")
    find(".email-opt-in").trigger("click")

    click_button("Add To Cart")

    find(".js-cart.is-visible")

    click_link("CHECKOUT");

    expect(current_path).to eql(new_checkout_shipping_form_path)

    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "johndoe@example.com"
    fill_in "Address 1", with: "321 Elm St"
    fill_in "City", with: "Boston"
    select "MA", from: "State"
    fill_in "Zip", with: "02115"

    click_button "Continue"

    expect(current_path).to eql(new_checkout_credit_card_path)
    # "/checkout/billing/new"

    fill_in "Card name", with: "John Doe"
    fill_in "Card number", with: "4242424242424242"
    fill_in "Exp month", with: "08"
    fill_in "Exp year", with: "2022"
    fill_in "Cvc", with: "123"

    click_button "Continue"

    expect(page).to have_content("Cart Items")
    expect(current_path).to eql(new_checkout_order_confirmation_path)

    click_button "Complete Order"

    expect(current_path).to eql(checkout_order_confirmations_path)
    expect(page).to have_content("Thanks For Your Order")
    expect(page).to have_content("XXXXXXXXXXXX4242")
  end
end

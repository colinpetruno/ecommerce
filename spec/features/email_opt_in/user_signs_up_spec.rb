require "rails_helper"

describe "email opt in modal", type: :feature, js: true do
  it "shows the form and lets a user enter their email" do
    visit root_path
    expect(page).to have_selector(".email-opt-in", visible: true)

    fill_in("email_subscriber_email", with: "test_user@example.com")
    find("#new_email_subscriber").find("button").click

    expect(page).to have_selector(".email-opt-in", visible: true)

    expect(page).
      to have_content("Thank You! test_user@example.com has been subscribed!")

    find(".email-opt-in").click
    expect(page).to have_selector(".email-opt-in", visible: false)

    User.delete_all
  end
end

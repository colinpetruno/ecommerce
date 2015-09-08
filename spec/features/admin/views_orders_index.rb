require 'rails_helper'

describe "the admin orders pages", type: :feature do
  it "shows the correct number of orders for each scope" do
    user = FactoryGirl.create(:user, :site_admin)
    login_as(user, :scope => :user)

    create(:order, status: 0)
    create_pair(:order, status: 1)
    create_list(:order, 3, status: 2)

    visit admin_path
    click_link "Orders"
    click_link "Completed"
    expect(page).to have_selector('.order', count: 3)

    click_link "Orders"
    click_link "In Progress"
    expect(page).to have_selector('.order', count: 1)

    click_link "Orders"
    click_link "Abandoned"
    expect(page).to have_selector('.order', count: 2)
  end
end

require 'rails_helper'

describe "the dashboard page", type: :feature do
  it "has the right stats" do
    user = FactoryGirl.create(:user, :site_admin)
    login_as(user, :scope => :user)

    create(:order, session_id: 1)
    create(:order, session_id: 2, status: 0)

    visit admin_path

    expect(page).to have_content("50%")
  end
end

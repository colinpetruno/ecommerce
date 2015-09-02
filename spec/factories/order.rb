FactoryGirl.define do
  factory :order do
    session_id 3
    # user_id
    status 2
    email "foo@example.com"
    # funding_instrument_id
  end
end

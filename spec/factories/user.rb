FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'

    trait :site_admin do
      role 1
    end
  end
end

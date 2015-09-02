FactoryGirl.define do
  factory :page_view do
    session_id { rand(1..4) }
    operating_system { ['windows', 'mac'].sample }
    browser { ['chrome', 'ie', 'firefox'].sample }
    browser_version { rand(10..15) }
  end
end

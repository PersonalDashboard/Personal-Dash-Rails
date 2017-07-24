FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "example#{n}@murjax.com" }
    password 'password'
    password_confirmation 'password'
    home_city "Jacksonville"
  end

  factory :dashboard do
    association :user
  end
end

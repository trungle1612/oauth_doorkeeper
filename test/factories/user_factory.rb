FactoryGirl.define do
  factory :user do
    # Required attributes
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
  end
end

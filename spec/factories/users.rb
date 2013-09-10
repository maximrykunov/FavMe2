FactoryGirl.define do
  factory :user do
    name { "#{ Faker::Name.first_name } #{ Faker::Name.last_name }" }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    password '111111'
    password_confirmation '111111'
    confirmed_at Date.yesterday
    # roles_mask 0
  end
end

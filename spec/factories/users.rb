require 'faker'

FactoryGirl.define do
  factory :user, :aliases => [:author, :viewer, :collaborator ] do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { "secret123" }

    factory :admin do
      account_type "admin"
    end
  end

  factory :premium_user do
    account_type = "premium"
  end

  factory :invalid_user do
    name nil
    email nil
    password nil
  end

end
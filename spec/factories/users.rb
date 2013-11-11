require 'faker'

FactoryGirl.define do
  factory :user, :aliases => [:author, :viewer, :collaborator ] do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { "secret123" }
  end

  factory :premium_user do
    account_type = "premium"
  end
end
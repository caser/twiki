require 'faker'

FactoryGirl.define do

  factory :wiki, :aliases => [:editable_wiki, :viewable_wiki] do
    title { Faker::Name.title }
    author
  end

end
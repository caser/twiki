require 'faker'

FactoryGirl.define do

  factory :wiki, :aliases => [:editable_wiki, :viewable_wiki] do
    title { Faker::Lorem.words(rand(2..6)) }
    author
  end

  factory :invalid_wiki, parent: :wiki do
    title nil
    author nil
  end

end
require 'faker'

FactoryGirl.define do

  sequence :internal_id do |i|
    "section-#{i}"
  end

  factory :section do
    title { Faker::Lorem.words(rand(1..5)).join(" ") }
    content { Faker::Lorem.paragraphs(rand(3..7)).join("\n") }
    internal_id
    author
    wiki
  end

  factory :invalid_section, parent: :section do
    title nil
    content nil
  end

end
require 'faker'

FactoryGirl.define do

  sequence :internal_id do |i|
    "section-#{i}"
  end

  factory :section do
    title { Faker::Name.title }
    content { Faker::Lorem.paragraphs }
    internal_id
    author
    wiki
  end

  factory :invalid_section do
    title nil
    content nil
  end

end
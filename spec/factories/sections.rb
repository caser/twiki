require 'faker'

FactoryGirl.define do

  sequence :version do |v|
    "version#{v}"
  end

  sequence :internal_id do |i|
    "section-#{i}"
  end

  factory :section do
    title { Faker::Name.title }
    version
    content { Faker::Lorem.paragraphs }
    internal_id
    author
    wiki
  end

end
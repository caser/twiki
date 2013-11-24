require 'faker'

rand(10..30).times do
  u = User.create!(name: Faker::Name.first_name, password: "secret123", email: Faker::Internet.email)
  rand(3..10).times do
    w = u.wikis.create!(title: Faker::Lorem.words(rand(1..6)).join(" ")
    rand(2..8).times do |i|
      s = w.sections.create(title: Faker::Lorem.words(rand(1..8)).join(" "), content: Faker::Lorem.paragraphs(rand(1..2)).join("\n"), author: u, internal_id: i)
    end
  end
end
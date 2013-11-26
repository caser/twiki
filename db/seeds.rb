require 'faker'

rand(10..30).times do
  u = User.create!(name: Faker::Name.first_name, password: "secret123", email: Faker::Internet.email)
  rand(3..10).times do
    w = u.wikis.create!(title: Faker::Lorem.words(rand(1..6)).join(" "))
    rand(2..8).times do |i|
      s = w.sections.create(title: Faker::Lorem.words(rand(1..8)).join(" "), content: Faker::Lorem.paragraphs(rand(1..2)).join("\n"), author: u, internal_id: i)
    end
  end
end

u = User.new(
name: 'Admin User',
email: 'admin@example.com',
password: 'helloworld',
password_confirmation: 'helloworld'
)
u.skip_confirmation!
u.save
u.update_attribute(:account_type, 'admin')

u = User.new(
  name: 'Moderator User',
  email: 'moderator@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld'
)
u.skip_confirmation!
u.save
u.update_attribute(:account_type, :'moderator')

u = User.new(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld'
)
u.skip_confirmation!
u.save
puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
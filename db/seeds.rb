require 'faker'

# Create User
5.times do 
  user = User.new(
    user_name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Create Wikis

10.times do 
  Wiki.create!(
    title: Faker::Lorem.word,
    body: Faker::Lorem.paragraph(2)
    )
end

# Create an admin User
admin = User.new(
  user_name: 'Yvonne',
  email: 'yvonne.koppen@gmail.com',
  password: 'helloworld'
  )

admin.skip_confirmation!
admin.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
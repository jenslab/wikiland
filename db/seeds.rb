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
    user_id: users.sample.id,
    title: Faker::Lorem.word,
    body: Faker::Lorem.paragraph(2),
    private: false,
    )
end

# Create an admin User
admin = User.new(
  user_name: 'admin',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
  )

admin.skip_confirmation!
admin.save!

premium = User.new(
  user_name: 'premium',
  email: 'premium@example.com',
  password: 'helloworld',
  role: 'premium'
  )

premium.skip_confirmation!
premium.save!

standard = User.new(
  user_name: 'standard',
  email: 'standard@example.com',
  password: 'helloworld',
  )

standard.skip_confirmation!
standard.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
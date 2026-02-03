# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all

user1 = User.create!(
  email: 'test@example.com',
  password: 'password',
  password_confirmation: 'password'
)

user2 = User.create!(
  email: 'other@example.com',
  password: 'password',
  password_confirmation: 'password'
)

10.times do |i|
  user1.boards.create!(
    title: "自分のボード #{i+1}",
    content: Faker::Lorem.sentence(word_count: 10)
  )
end

10.times do |i|
  user2.boards.create!(
    title: "他の人のボード #{i+1}",
    content: Faker::Lorem.sentence(word_count: 10)
  )
end
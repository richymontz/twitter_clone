# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


#Create Users

puts "======= CREATING INITIAL DATA ======="
puts "--> Creating Initial User"
user = FactoryBot.create(:user, :with_tweets)

puts "done!"

puts "--> Creating more user"
users = FactoryBot.create_list(:user, 3, :with_tweets)

puts "New users usersnames"
users.each{|user| puts "@#{user.username}"}

puts "done!"


puts "this is initial user: #{user.username} pass: #{user.password}"
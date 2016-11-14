# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username:  "Iamtheadmin",
             email: "zhwtf@gmail.com",
             password:              "Zhwtf2567369!",
             password_confirmation: "Zhwtf2567369!",
             is_admin: true,
             firstname: "hao",
             lastname: "zheng")

30.times do |n|
  name  = Faker::Name.first_name
  email = "example-#{n+1}@gmail.com"
  password = "Password123!"
  firstname = Faker::Name.first_name 
  lastname = Faker::Name.last_name


  User.create!(username:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               firstname: firstname,
               lastname: lastname,
               is_admin: false)
end
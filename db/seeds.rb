# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "users"

require 'ffaker'  
1000.times do
  user = User.create!(
    name: FFaker::NameBR.name, 
    email: FFaker::Internet.email, 
    cpf: FFaker::IdentificationBR.pretty_cpf, 
  )

  puts user
end
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Run.destroy_all
User.destroy_all

puts "Creating users..."

demo = User.create!(
  email: "demo@email.com",
  password: "123123"
)

ana = User.create!(
  email: "ana@email.com",
  password: "123123",
  name: "Ana Silva",
  birth_date: Date.new(1992, 5, 12),
  phone: "11987654321",
  gender: "female"
)

carlos = User.create!(
  email: "carlos@email.com",
  password: "123123",
  name: "Carlos Souza",
  birth_date: Date.new(1988, 9, 3),
  phone: "11981234567",
  gender: "male"
)

maria = User.create!(
  email: "maria@email.com",
  password: "123123",
  name: "Maria Oliveira",
  birth_date: Date.new(1995, 2, 20),
  phone: "11993456789",
  gender: "female"
)

joao = User.create!(
  email: "joao@email.com",
  password: "123123",
  name: "João Santos",
  birth_date: Date.new(1990, 11, 8),
  phone: "11992345678",
  gender: "male"
)

pedro = User.create!(
  email: "pedro@email.com",
  password: "123123",
  name: "Pedro Lima",
  birth_date: Date.new(1993, 7, 17),
  phone: "11995678901",
  gender: "male"
)

puts "Creating runs..."

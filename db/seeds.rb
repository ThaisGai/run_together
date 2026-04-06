# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
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

# Runs mistas (women_only: false) — qualquer usuário pode participar
Run.create!(
  date: Date.today + 3,
  time: "07:00",
  location: "Parque Ibirapuera, São Paulo - SP",
  latitude: -23.5874,
  longitude: -46.6576,
  pace: "5:00",
  max_participants: 10,
  women_only: false,
  user: carlos
)

Run.create!(
  date: Date.today + 5,
  time: "06:30",
  location: "Parque Villa-Lobos, São Paulo - SP",
  latitude: -23.5489,
  longitude: -46.7172,
  pace: "6:00",
  max_participants: 15,
  women_only: false,
  user: joao
)

Run.create!(
  date: Date.today + 7,
  time: "08:00",
  location: "Parque Estadual da Cantareira, São Paulo - SP",
  latitude: -23.4031,
  longitude: -46.6242,
  pace: "5:30",
  max_participants: 20,
  women_only: false,
  user: pedro
)

Run.create!(
  date: Date.today + 10,
  time: "07:30",
  location: "Parque Trianon, São Paulo - SP",
  latitude: -23.5615,
  longitude: -46.6560,
  pace: "4:30",
  max_participants: 5,
  women_only: false,
  user: carlos
)

# Runs women only (women_only: true) — criadas apenas por usuárias female
Run.create!(
  date: Date.today + 2,
  time: "06:00",
  location: "Parque Ibirapuera, São Paulo - SP",
  latitude: -23.5874,
  longitude: -46.6576,
  pace: "6:30",
  max_participants: 10,
  women_only: true,
  user: ana
)

Run.create!(
  date: Date.today + 4,
  time: "07:00",
  location: "Parque Aclimação, São Paulo - SP",
  latitude: -23.5694,
  longitude: -46.6289,
  pace: "5:00",
  max_participants: 15,
  women_only: true,
  user: maria
)

Run.create!(
  date: Date.today + 9,
  time: "08:30",
  location: "Parque da Independência, São Paulo - SP",
  latitude: -23.5867,
  longitude: -46.6228,
  pace: "7:00",
  max_participants: 20,
  women_only: false,
  user: ana
)

puts "Done! #{User.count} users and #{Run.count} runs created."

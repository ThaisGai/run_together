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

# Novos usuários
julia = User.create!(
  email: "julia@email.com",
  password: "123123",
  name: "Julia Ferreira",
  birth_date: Date.new(1997, 3, 25),
  phone: "11994321098",
  gender: "female"
)

lucas = User.create!(
  email: "lucas@email.com",
  password: "123123",
  name: "Lucas Mendes",
  birth_date: Date.new(1991, 6, 14),
  phone: "11996543210",
  gender: "male"
)

beatriz = User.create!(
  email: "beatriz@email.com",
  password: "123123",
  name: "Beatriz Costa",
  birth_date: Date.new(1994, 10, 30),
  phone: "11997654321",
  gender: "female"
)

rafael = User.create!(
  email: "rafael@email.com",
  password: "123123",
  name: "Rafael Nunes",
  birth_date: Date.new(1989, 1, 19),
  phone: "11998765432",
  gender: "male"
)

fernanda = User.create!(
  email: "fernanda@email.com",
  password: "123123",
  name: "Fernanda Alves",
  birth_date: Date.new(1996, 8, 7),
  phone: "11999876543",
  gender: "female"
)

rafaela = User.create!(
  email: "rafaela@email.com",
  password: "123123",
  name: "Rafaela Bezerra",
  birth_date: Date.new(1990, 10, 3),
  phone: "11999876663",
  gender: "female"
  )

puts "Creating runs..."

# --- Corridas mistas ---

run1 = Run.create!(
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

run2 = Run.create!(
  date: Date.today + 5,
  time: "06:30",
  location: "Parque Villa-Lobos, São Paulo - SP",
  latitude: -23.5489,
  longitude: -46.7172,
  pace: "6:00",
  max_participants: 10,
  women_only: false,
  user: joao
)

run3 = Run.create!(
  date: Date.today + 7,
  time: "08:00",
  location: "Parque Estadual da Cantareira, São Paulo - SP",
  latitude: -23.4031,
  longitude: -46.6242,
  pace: "5:30",
  max_participants: 10,
  women_only: false,
  user: pedro
)

# Corrida mista com max_participants: 5 — será preenchida
# Dono (carlos) + 4 RunMembers = 5 participantes
run4 = Run.create!(
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

run5 = Run.create!(
  date: Date.today + 12,
  time: "06:00",
  location: "Parque do Carmo, São Paulo - SP",
  latitude: -23.5450,
  longitude: -46.4790,
  pace: "5:45",
  max_participants: 10,
  women_only: false,
  user: lucas
)

run6 = Run.create!(
  date: Date.today + 14,
  time: "07:00",
  location: "Parque Estadual Alberto Löfgren, São Paulo - SP",
  latitude: -23.4682,
  longitude: -46.6291,
  pace: "6:15",
  max_participants: 5,
  women_only: false,
  user: rafael
)

# --- Corridas women only ---

run7 = Run.create!(
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

run8 = Run.create!(
  date: Date.today + 4,
  time: "07:00",
  location: "Parque Aclimação, São Paulo - SP",
  latitude: -23.5694,
  longitude: -46.6289,
  pace: "5:00",
  max_participants: 10,
  women_only: true,
  user: maria
)

run9 = Run.create!(
  date: Date.today + 9,
  time: "08:30",
  location: "Parque da Independência, São Paulo - SP",
  latitude: -23.5867,
  longitude: -46.6228,
  pace: "7:00",
  max_participants: 10,
  women_only: false,
  user: ana
)

# Corrida women only com max_participants: 5 — será preenchida
# Dona (julia) + 4 RunMembers femininas = 5 participantes
run10 = Run.create!(
  date: Date.today + 6,
  time: "07:30",
  location: "Parque Tenente Siqueira Campos, São Paulo - SP",
  latitude: -23.5581,
  longitude: -46.6608,
  pace: "5:30",
  max_participants: 5,
  women_only: true,
  user: julia
)

run11 = Run.create!(
  date: Date.today + 11,
  time: "06:30",
  location: "Parque Linear Córrego das Corujas, São Paulo - SP",
  latitude: -23.5920,
  longitude: -46.7280,
  pace: "6:00",
  max_participants: 10,
  women_only: true,
  user: beatriz
)

puts "Adding members to runs..."

# run4 (max: 5, mista) — lotada: carlos (dono, já é membro) + 4 RunMembers
RunMember.create!(user: joao,     run: run4)
RunMember.create!(user: lucas,    run: run4)
RunMember.create!(user: rafael,   run: run4)
RunMember.create!(user: pedro,    run: run4)

# run10 (max: 5, women only) — lotada: julia (dona, já é membro) + 4 RunMembers femininas
RunMember.create!(user: ana,      run: run10)
RunMember.create!(user: beatriz,  run: run10)
RunMember.create!(user: maria,    run: run10)
RunMember.create!(user: fernanda, run: run10)

# Participantes em outras corridas (parcialmente preenchidas)
RunMember.create!(user: ana,      run: run1)
RunMember.create!(user: maria,    run: run1)
RunMember.create!(user: beatriz,  run: run1)

RunMember.create!(user: pedro,    run: run2)
RunMember.create!(user: rafael,   run: run2)

RunMember.create!(user: julia,    run: run3)
RunMember.create!(user: lucas,    run: run3)
RunMember.create!(user: fernanda, run: run3)

RunMember.create!(user: julia,    run: run7)
RunMember.create!(user: fernanda, run: run7)

RunMember.create!(user: ana,      run: run8)
RunMember.create!(user: julia,    run: run8)
RunMember.create!(user: beatriz,  run: run8)

RunMember.create!(user: fernanda, run: run11)
RunMember.create!(user: maria,    run: run11)

puts "Done! #{User.count} users, #{Run.count} runs and #{RunMember.count} memberships created."

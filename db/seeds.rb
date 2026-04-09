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

puts "Cleaning database..."
User.destroy_all

puts "Creating users..."

# Usuário demo fixo
demo = User.create!(
  email: "demo@email.com",
  password: "123123",
  username: "demo",
  name: "Demo User",
  bio: "Adoro correr e conhecer pessoas novas.",
  birth_date: Date.new(1990, 1, 1),
  phone: "11999999999",
  gender: "other",
  runs_completed: rand(5..30),
  created_at: 6.months.ago
)

ana = User.create!(
email: "ana@email.com",
password: "123123",
username: "ana_silva",
name: "Ana Silva",
bio: "Corro para relaxar depois do trabalho.",
birth_date: Date.new(1992, 5, 12),
phone: "11987654321",
gender: "female",
runs_completed: 12,
created_at: 5.months.ago
)

carlos = User.create!(
email: "carlos@email.com",
password: "123123",
username: "carlos_souza",
name: "Carlos Souza",
bio: "Treinando para minha próxima meia maratona.",
birth_date: Date.new(1988, 9, 3),
phone: "11981234567",
gender: "male",
runs_completed: 28,
created_at: 8.months.ago
)

maria = User.create!(
email: "maria@email.com",
password: "123123",
username: "maria_oliveira",
name: "Maria Oliveira",
bio: "Corrida é minha terapia.",
birth_date: Date.new(1995, 2, 20),
phone: "11993456789",
gender: "female",
runs_completed: 9,
created_at: 3.months.ago
)

joao = User.create!(
email: "joao@email.com",
password: "123123",
username: "joao_santos",
name: "João Santos",
bio: "Sempre em busca de novos desafios.",
birth_date: Date.new(1990, 11, 8),
phone: "11992345678",
gender: "male",
runs_completed: 21,
created_at: 7.months.ago
)

pedro = User.create!(
email: "pedro@email.com",
password: "123123",
username: "pedro_lima",
name: "Pedro Lima",
bio: "Corrida + café = felicidade.",
birth_date: Date.new(1993, 7, 17),
phone: "11995678901",
gender: "male",
runs_completed: 17,
created_at: 4.months.ago
)

julia = User.create!(
email: "julia@email.com",
password: "123123",
username: "julia_ferreira",
name: "Julia Ferreira",
bio: "Adoro correr no Ibirapuera.",
birth_date: Date.new(1997, 3, 25),
phone: "11994321098",
gender: "female",
runs_completed: 11,
created_at: 2.months.ago
)

lucas = User.create!(
email: "lucas@email.com",
password: "123123",
username: "lucas_mendes",
name: "Lucas Mendes",
bio: "Treinos noturnos são os melhores.",
birth_date: Date.new(1991, 6, 14),
phone: "11996543210",
gender: "male",
runs_completed: 19,
created_at: 6.months.ago
)

beatriz = User.create!(
email: "beatriz@email.com",
password: "123123",
username: "beatriz_costa",
name: "Beatriz Costa",
bio: "Cada km é uma conquista.",
birth_date: Date.new(1994, 10, 30),
phone: "11997654321",
gender: "female",
runs_completed: 14,
created_at: 3.months.ago
)

rafael = User.create!(
email: "rafael@email.com",
password: "123123",
username: "rafael_nunes",
name: "Rafael Nunes",
bio: "Treinando para melhorar meu pace.",
birth_date: Date.new(1989, 1, 19),
phone: "11998765432",
gender: "male",
runs_completed: 26,
created_at: 9.months.ago
)

fernanda = User.create!(
email: "fernanda@email.com",
password: "123123",
username: "fernanda_alves",
name: "Fernanda Alves",
bio: "Correr me dá energia.",
birth_date: Date.new(1996, 8, 7),
phone: "11999876543",
gender: "female",
runs_completed: 13,
created_at: 4.months.ago
)

rafaela = User.create!(
email: "rafaela@email.com",
password: "123123",
username: "rafaela_bezerra",
name: "Rafaela Bezerra",
bio: "Correndo para uma vida mais saudável.",
birth_date: Date.new(1990, 10, 3),
phone: "11999876663",
gender: "female",
runs_completed: 16,
created_at: 5.months.ago
)


# Criar usuários aleatórios
10.times do
  name = Faker::Name.name
  username = Faker::Internet.username(specifier: 5..10, separators: ['_'])

  User.create!(
    email: Faker::Internet.unique.email,
    password: "123123",
    username: username,
    name: name,
    bio: Faker::Quote.most_interesting_man_in_the_world,
    birth_date: Faker::Date.birthday(min_age: 20, max_age: 45),
    phone: Faker::PhoneNumber.cell_phone_in_e164,
    gender: ["male", "female"].sample,
    runs_completed: rand(0..50),
    created_at: rand(1..12).months.ago
  )
end

puts "Created #{User.count} users"

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

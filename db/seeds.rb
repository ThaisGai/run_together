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
User.destroy_all

# Criar usuário
user = User.create!(email: "teste1@email.com", password: "123123")

Run.create!(
  date: Date.today + 30,
  time: "07:00",
  location: "Lisbon, Portugal",
  pace: "5:00/km",
  private: false,
  user: user
)

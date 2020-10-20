# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FactoryBot.create(:user, email: "Billy@email.com", username: "Billy", password: "b")
FactoryBot.create(:user, email: "Joe@email.com", username: "Joe", password: "j")
FactoryBot.create(:user, email: "Tony@email.com", username: "Tony", password: "t")
FactoryBot.create(:user, email: "Steve@email.com", username: "Steve", password: "s")

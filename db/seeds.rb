# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.first_or_create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
puts 'AdminUser found or created!'
[
  { title: 'Soldier', title_ru: 'Военный', description: 'Военнообязанный, будь то боец СОБР, спецназа, ГАИ, МВД, и т.д.', code: :soldier },
  { title: 'Victim', title_ru: 'Жертва задержаний', description: 'Человек, пострадавший от задержаний, конфликтов во время мирных митингов', code: :victim },
  { title: 'Employee', title_ru: 'Сотрудник бастующего предприятия', description: 'Сотрудник предприятия, которое перестало функционировать из-за забастовок', code: :employee }
].each do |attrs|
  UserType.create(attrs) unless UserType.find_by(code: attrs[:code]).present?
end
puts 'UserTypes found or created!'

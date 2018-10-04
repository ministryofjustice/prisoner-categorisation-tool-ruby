# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Case.create!(
  [
    { name: 'John Smith', nomis_id: 'AA111', due_date: 2.days.from_now, status: 'initial' },
    { name: 'Rob Jones', nomis_id: 'AB123', due_date: 3.days.from_now, status: 'recategorisation' },
    { name: 'Ben Williams', nomis_id: 'AC991', due_date: 1.days.from_now, status: 'referred' },
    { name: 'Alex Smtih', nomis_id: 'AB222', due_date: 4.days.from_now, status: 'advised' },
    { name: 'James Hetfield', nomis_id: 'AB432', due_date: 1.days.from_now, status: 'initial' },
    { name: 'Bruce Dickinson', nomis_id: 'AD223', due_date: 2.days.from_now, status: 'recategorisation' },
    { name: 'Rob Halford', nomis_id: 'AE321', due_date: 2.days.from_now, status: 'initial' },
  ]
)

User.create!(
  [
    { email: 'manager@example.com', role: 'offender_manager', password: 'testing123', password_confirmation: 'testing123' },
    { email: 'supervisor@example.com', role: 'supervisor', password: 'testing123', password_confirmation: 'testing123' },
    { email: 'security@example.com', role: 'security_department', password: 'testing123', password_confirmation: 'testing123' },
    { email: 'regional@example.com', role: 'regional_intelligence_unit', password: 'testing123', password_confirmation: 'testing123' },
  ]
)

(1..6).each do |n|
  Section.create(id: n)
end
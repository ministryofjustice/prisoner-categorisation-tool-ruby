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

(1..7).each do |n|
  Section.create(id: n)
end

Case.all.each do |c|

  # Section 1
  answer_json = {
    establishment: 'BMI',
    index_of_offence: 1,
    summary_of_previous_offences: 'Stole a loaf of bread',
    nationality: 'British',
    sentence_length: 10
  }

  Answer.create(
    case_id: c.id,
    section_id: 1,
    serialized_answers: answer_json.to_s
  )

  # Section 2
  answer_json = {

  }

  Answer.create(
    case_id: c.id,
    section_id: 2,
    serialized_answers: answer_json.to_s
  )

  # Section 3
  answer_json = {

  }

  Answer.create(
    case_id: c.id,
    section_id: 3,
    serialized_answers: answer_json.to_s
  )

  # Section 4
  answer_json = {

  }

  Answer.create(
    case_id: c.id,
    section_id: 4,
    serialized_answers: answer_json.to_s
  )

  # Section 5
  answer_json = {

  }

  Answer.create(
    case_id: c.id,
    section_id: 5,
    serialized_answers: answer_json.to_s
  )

  # Security section
  answer_json = {

  }

  Answer.create(
    case_id: c.id,
    section_id: 6,
    serialized_answers: answer_json.to_s
  )

  # Supervisor
  answer_json = {

  }

  Answer.create(
    case_id: c.id,
    section_id: 7,
    serialized_answers: answer_json.to_s
  )
end

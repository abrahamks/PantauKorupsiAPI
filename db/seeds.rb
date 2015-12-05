# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: 'test@example.com', name:'test_user', password: '12345678', password_confirmation: '12345678')

100.times do
  Actor.create!(name: FFaker::Name.name, profile_url: FFaker::Internet.domain_name, description: FFaker::Company.bs)
  Organization.create!(name: FFaker::Company.name, organization_url: FFaker::Internet.domain_name, description: FFaker::Company.bs)
end
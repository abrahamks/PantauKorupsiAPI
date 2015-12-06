# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: 'test@example.com', name:'test_user', password: '12345678', password_confirmation: '12345678')
User.create!(email: 'admin@example.com', name:'test_user', password: '12345678', password_confirmation: '12345678', moderator: true)
# Issue.create!(title: 'Papa minta saham', description: 'Ketua DPR meminta saham kepada bos freeport', occured_at: '2015-12-01')

TOTAL_SEEDED_ACTORS = 100
TOTAL_SEEDED_ORGANIZATIONS = 100
TOTAL_SEEDED_ISSUES = 100

TOTAL_SEEDED_ACTORS.times do
  Actor.create!(
    name: FFaker::Name.name, 
    profile_url: FFaker::Internet.domain_name, 
    image_url: "http://1.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=512", 
    description: Faker::Lorem.paragraph
  )
end

TOTAL_SEEDED_ORGANIZATIONS.times do
  Organization.create!(
    name: FFaker::Company.name, 
    organization_url: FFaker::Internet.domain_name, 
    description: FFaker::Company.bs
  )
end

TOTAL_SEEDED_ISSUES.times do
  issue = Issue.create!(
    title:  Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    started_at: Time.now,
    finished_at: nil,
    financial_cost: rand(1..2000) * 1000000000,
    procurement_url: nil,
    user_id: 1,
    verifier_id: 1,
    verified_at: Time.now,
    status_id: rand(1..12)
  )

  rand(1..4).times do
    issue.organizations << Organization.find(rand(1..TOTAL_SEEDED_ORGANIZATIONS))
  end

  rand(1..4).times do
    Involvement.create!(
      issue_id: issue.id, 
      actor_id: rand(1..TOTAL_SEEDED_ACTORS), 
      actor_status_id: rand(1..4)
    )
  end

  rand(1..20).times do
    Feed.create!(
      title: FFaker::Lorem.sentence,
      summary: FFaker::Lorem.paragraph,
      url: FFaker::Internet.domain_name,
      user_id: 1,
      issue_id: issue.id,
      verifier_id: 1,
      verified_at: Time.now,
      occured_at: Time.now
    )
  end
end
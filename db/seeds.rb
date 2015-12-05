# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: 'test@example.com', name:'test_user', password: '12345678', password_confirmation: '12345678')
# Issue.create!(title: 'Papa minta saham', description: 'Ketua DPR meminta saham kepada bos freeport', occured_at: '2015-12-01')
100.times do
  Actor.create!(name: FFaker::Name.name, profile_url: FFaker::Internet.domain_name, description: FFaker::Company.bs)
  Organization.create!(name: FFaker::Company.name, organization_url: FFaker::Internet.domain_name, description: FFaker::Company.bs)
end

Status.create(name:'Laporan/pengaduan/tertangkap tangan')
Status.create(name:'Penyelidikan')
Status.create(name:'Penyidikan')
Status.create(name:'Penangkapan')
Status.create(name:'Penahanan')
Status.create(name:'Penggeledahan')
Status.create(name:'Penyitaan')
Status.create(name:'Bantuan hukum')
Status.create(name:'Prapenuntutan dan penuntutan')
Status.create(name:'Prapenuntutan dan penuntutan')
Status.create(name:'Praperadilan')
Status.create(name:'Sidang pengadilan')
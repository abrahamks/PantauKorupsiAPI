User.create!(email: 'moderator@example.com', name:'Moderator', password: '12345678', password_confirmation: '12345678', moderator: true)
User.create!(email: 'admin@example.com', name:'Administrator', password: '12345678', password_confirmation: '12345678', moderator: true)
User.create!(email: 'test@example.com', name:'Fatima', password: '12345678', password_confirmation: '12345678', moderator: false)

a_atut = Actor.create!(
  name: "Ratu Atut Chosiyah", 
  profile_url: "https://id.wikipedia.org/wiki/Ratu_Atut_Chosiyah", 
  image_url: "https://upload.wikimedia.org/wikipedia/id/6/64/Ratu_Atut.jpg", 
  description: "Mantan Gubernur Provinsi Banten yang menjabat dua periode mulai 2007 hingga resmi dinonaktifkan pada 13 Mei 2014. Ia adalah Gubernur Wanita Indonesia pertama."
)

a_akil = Actor.create!(
  name: "Akil Mochtar", 
  profile_url: "https://id.wikipedia.org/wiki/Akil_Mochtar", 
  image_url: "https://upload.wikimedia.org/wikipedia/id/2/27/Akilmochtar.jpg", 
  description: "Ketua Mahkamah Konstitusi Republik Indonesia periode 2013 dan Hakim Konstitusi periode 2008-2013. Pernah menjabat sebagai anggota DPR RI periode 1999-2004, dan kemudian terpilih lagi untuk periode 2004-2009, juga sebagai Wakil Ketua Komisi III DPR RI (bidang hukum, perundang-undangan, HAM dan keamanan) periode 2004-2006."
)

a_chaeri = Actor.create!(
  name: "Tubagus Chaeri Wardana",
  profile_url: "http://profile.metrotvnews.com/read/30/tubagus-chaeri-wardana", 
  image_url: "http://sinarharapan.co/foto_berita/26ChaeriWardana-Wawan-www.metrotvnews.com.jpg", 
  description: "Adik Gubernur Banten Atut Chosiyah"
)

o_banten = Organization.create!(
  name: "Pemerintah Provinsi Banten", 
  organization_url: "http://bantenprov.go.id/", 
  description: "Banten adalah sebuah provinsi di Tatar Pasundan, serta wilayah paling barat di Pulau Jawa, Indonesia. Provinsi ini pernah menjadi bagian dari Provinsi Jawa Barat, namun menjadi wilayah pemekaran sejak tahun 2000, dengan keputusan Undang-Undang Nomor 23 Tahun 2000. Pusat pemerintahannya berada di Kota Serang."
)

o_mk = Organization.create!(
  name: "Mahkamah Konstitusi Republik Indonesia", 
  organization_url: "http://www.mahkamahkonstitusi.go.id/", 
  description: "Lembaga tinggi negara dalam sistem ketatanegaraan Indonesia yang merupakan pemegang kekuasaan kehakiman bersama-sama dengan Mahkamah Agung."
)

i_atut_lebak = Issue.create!(
  title: "Suap Pilkada Lebak Banten",
  description: "Gubernur Banten Ratu Atut Chosiyah ini didakwa menyuap Ketua Mahkamah Konstitusi Akil Mochtar untuk membatalkan kemenangan Iti Oktavia Jayabaya-Ade Sumardi dan memintanya memenangkan pasangan Amir Hamzah-Kasmin pada Pilkada Lebak Banten 2013.",
  started_at: Time.new(2014, 10, 3),
  finished_at: nil,
  financial_cost: 40_000_000_000,
  procurement_url: nil,
  user_id: 1,
  verifier_id: 1,
  verified_at: Time.now,
  status_id: 6
)

i_atut_lebak.organizations << o_banten
i_atut_lebak.organizations << o_mk

Involvement.create!(
  issue_id: i_atut_lebak.id, 
  actor_id: a_atut.id, 
  actor_status_id: 4
)

Involvement.create!(
  issue_id: i_atut_lebak.id, 
  actor_id: a_akil.id, 
  actor_status_id: 4
)

Involvement.create!(
  issue_id: i_atut_lebak.id, 
  actor_id: a_chaeri.id, 
  actor_status_id: 4
)

Feed.create!(
  title: "Ratu Atut Chosiyah mulai berkuasa sebagai Gubernur Banten",
  summary: FFaker::Lorem.paragraph,
  url: "http://kompas.com",
  user_id: 1,
  issue_id: i_atut_lebak.id,
  verifier_id: 1,
  verified_at: Time.now,
  occured_at: Time.new(2001, 12, 03)
)

Feed.create!(
  title: "MK Putuskan Airin-Benjamin Menang",
  summary: FFaker::Lorem.paragraph,
  url: "http://kompas.com",
  user_id: 1,
  issue_id: i_atut_lebak.id,
  verifier_id: 1,
  verified_at: Time.now,
  occured_at: Time.new(2011, 4, 20)
)

Feed.create!(
  title: "Tender Proyek Tidak Fair",
  summary: FFaker::Lorem.paragraph,
  url: "http://kompas.com",
  user_id: 1,
  issue_id: i_atut_lebak.id,
  verifier_id: 1,
  verified_at: Time.now,
  occured_at: Time.new(2012, 1, 2)
)

Feed.create!(
  title: "Menantu Atut Menangi Tender Sewa Rumah",
  summary: FFaker::Lorem.paragraph,
  url: "http://kompas.com",
  user_id: 1,
  issue_id: i_atut_lebak.id,
  verifier_id: 1,
  verified_at: Time.now,
  occured_at: Time.new(2012, 2, 2)
)

Feed.create!(
  title: "Menantu Atut Menangi Tender Sewa Rumah",
  summary: FFaker::Lorem.paragraph,
  url: "http://kompas.com",
  user_id: 1,
  issue_id: i_atut_lebak.id,
  verifier_id: 1,
  verified_at: Time.now,
  occured_at: Time.new(2012, 2, 2)
)

Feed.create!(
  title: "Wawan Kongkalikong Dengan DPRD Banten",
  summary: FFaker::Lorem.paragraph,
  url: "http://kompas.com",
  user_id: 1,
  issue_id: i_atut_lebak.id,
  verifier_id: 1,
  verified_at: Time.now,
  occured_at: Time.new(2012, 4, 20)
)

Feed.create!(
  title: "Atut dicekal nepergian",
  summary: FFaker::Lorem.paragraph,
  url: "http://kompas.com",
  user_id: 1,
  issue_id: i_atut_lebak.id,
  verifier_id: 1,
  verified_at: Time.now,
  occured_at: Time.new(2012, 10, 3)
)

Feed.create!(
  title: "SBY akan Menandatangani Surat Pemberhentian Sementara",
  summary: FFaker::Lorem.paragraph,
  url: "http://kompas.com",
  user_id: 1,
  issue_id: i_atut_lebak.id,
  verifier_id: 1,
  verified_at: Time.now,
  occured_at: Time.new(2014, 5, 8)
)






Actor.create!(
  name: "Djoko Susilo", 
  profile_url: "https://id.wikipedia.org/wiki/Akil_Mochtar", 
  image_url: "http://cdn.klimg.com/merdeka.com/i/w/tokoh/2012/07/31/5047/200x300/djoko-susilo.jpg", 
  description: "Djoko merupakan lulusan Akpol angkatan 1984 yang pertama mendapat bintang satu. Bintang itu diperolehnya saat dia menjadi Dirlantas. Sedangkan bintang dua didapat Djoko saat menduduki posisi Kakorlantas. Prestasi ini didapat Djoko lebih dulu ketimbang teman satu angkatannya, Putut Bayu Seno, yang pernah menjadi ajudan Presiden SBY dan kini menjabat Kapolda Jabar. Ketika menjadi orang nomor satu di Polres Jakarta Utara, nama Djoko bersinar lantaran bisa membangun mapolres pimpinannya tanpa melibatkan APBN dan Mabes Polri. Pembangunan itu sepenuhnya merupakan bantuan pengusaha."
)

Actor.create!(
  name: "Luthfi Hasan Ishaaq", 
  profile_url: "https://id.wikipedia.org/wiki/Akil_Mochtar", 
  image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Luthfi_Hasan.jpg/640px-Luthfi_Hasan.jpg?1449423777993", 
  description: "Presiden Partai Keadilan Sejahtera periode 2009 - 2014. Saat ini dia juga menjabat sebagai anggota DPR dari Fraksi PKS periode 2009 - 2014. Luthfi Hasan Ishaaq dijemput dan ditahan KPK pada tanggal 30 Januari 2013 dengan sangkaan menerima hadiah atau janji terkait dengan pengurusan kuota impor daging pada Kementerian Pertanian."
)

Actor.create!(
  name: "Rudi Rubiandini", 
  profile_url: "https://id.wikipedia.org/wiki/Akil_Mochtar", 
  image_url: "https://upload.wikimedia.org/wikipedia/id/2/22/Rudi_rubiandini.jpg", 
  description: "Akademisi dan pengamat perminyakan Indonesia. Ia mendapatkan gelar S1 Teknik Perminyakan di Institut Teknologi Bandung pada tahun 1985 dan lulus tingkat doktoral dengan gelar Dr.-Ing. dari Technische Universität Clausthal, Jerman, 1991. Dia pernah menjabat sebagai Wakil Menteri Energi dan Sumber Daya Mineral pada Kabinet Indonesia Bersatu II. Saat ini, dia menjabat sebagai Kepala SKK Migas."
)

Actor.create!(
  name: "Miranda Goeltom", 
  profile_url: "https://id.wikipedia.org/wiki/Akil_Mochtar", 
  image_url: "https://upload.wikimedia.org/wikipedia/id/6/65/Miranda_goeltom.jpg", 
  description: "Deputi senior gubernur Bank Indonesia dan guru besar Fakultas Ekonomi Universitas Indonesia. Sebelumnya dia menjabat sebagai deputi gubernur BI."
)

a_setya = Actor.create!(
  name: "Setya Novanto", 
  profile_url: "https://id.wikipedia.org/wiki/Akil_Mochtar", 
  image_url: "http://assets-a2.kompasiana.com/items/album/2015/11/17/catut-nama-564acd0a519373ed078d3cad.jpg?t=o&v=760", 
  description: "Ketua Dewan Perwakilan Rakyat Republik Indonesia"
)

a_reza = Actor.create!(
  name: "Reza Chalid", 
  profile_url: "http://cdn.klimg.com/merdeka.com/i/w/news/2015/12/04/632755/670x335/mkd-agendakan-periksa-riza-chalid-selasa-atau-rabu-pekan-depan.jpg", 
  image_url: "http://cdn.klimg.com/merdeka.com/i/w/news/2015/12/04/632755/670x335/mkd-agendakan-periksa-riza-chalid-selasa-atau-rabu-pekan-depan.jpg",
  description: "Pengusaha"
)




Organization.create!(
  name: "Polri", 
  organization_url: "http://bantenprov.go.id/", 
  description: "Kepolisian Republik Indonesia"
)

Organization.create!(
  name: "Kementerian Agama", 
  organization_url: "http://bantenprov.go.id/", 
  description: "Kementerian Agama Republik Indonesia"
)

Organization.create!(
  name: "Kementerian Pertanian", 
  organization_url: "http://bantenprov.go.id/", 
  description: "Kementerian Pertanian Republik Indonesia"
)

Organization.create!(
  name: "SKK Migas", 
  organization_url: "http://bantenprov.go.id/", 
  description: "Satuan Kerja Khusus Pelaksana Kegiatan Usaha Hulu Minyak dan Gas Bumi"
)

Organization.create!(
  name: "Bank Indonesia", 
  organization_url: "http://bantenprov.go.id/", 
  description: "Bank sentral pengatur peredaran mata uang di Indonesia"
)

o_dpr = Organization.create!(
  name: "DPR RI", 
  organization_url: "http://bantenprov.go.id/", 
  description: "Dewan Perwakilan Rakyat Republik Indonesia"
)

o_fp = Organization.create!(
  name: "PT Freeport Indonesia", 
  organization_url: "http://bantenprov.go.id/", 
  description: "Perusahaan tambang emas"
)


Issue.create!(
  title: "Aulia Pohan Tersangka Kasus Dana BI",
  description: FFaker::Lorem.paragraph,
  started_at: Time.new(2008, 9, 3),
  finished_at: nil,
  financial_cost: 100_000_000_000,
  procurement_url: nil,
  user_id: 1,
  verifier_id: 1,
  verified_at: Time.now,
  status_id: 6
)

Issue.create!(
  title: "Kasus Dana Haji Kementerian Agama",
  description: FFaker::Lorem.paragraph,
  started_at: Time.new(2008, 9, 3),
  finished_at: nil,
  financial_cost: 100_000_000_000,
  procurement_url: nil,
  user_id: 1,
  verifier_id: 1,
  verified_at: Time.now,
  status_id: 4
)

i_saham = Issue.create!(
  title: "Percobaan Korupsi Setya Novanto",
  description: "Pencatutan nama Presiden dan Wakil Presiden Republik Indonesia untuk meminta saham di PT Freeport.",
  started_at: Time.new(2015, 11, 3),
  finished_at: nil,
  financial_cost: 0,
  procurement_url: nil,
  user_id: 1,
  status_id: 1
)

Involvement.create!(
  issue_id: i_saham.id, 
  actor_id: a_setya.id, 
  actor_status_id: 4
)

Involvement.create!(
  issue_id: i_saham.id, 
  actor_id: a_reza.id, 
  actor_status_id: 4
)

i_saham.organizations << o_dpr
i_saham.organizations << o_fp

Feed.create!(
  title: "Sidang terbuka Mahkamah Kehormatan Dewan (MKD)",
  summary: FFaker::Lorem.paragraph,
  url: "http://kompas.com",
  user_id: 1,
  issue_id: i_saham.id,
  verifier_id: 1,
  verified_at: Time.now,
  occured_at: Time.new(2014, 5, 8)
)





TOTAL_SEEDED_ACTORS = 20
TOTAL_SEEDED_ORGANIZATIONS = 20
TOTAL_SEEDED_ISSUES = 20

TOTAL_SEEDED_ACTORS.times do
  Actor.create!(
    name: FFaker::Name.name, 
    profile_url: FFaker::Internet.domain_name, 
    image_url: "http://1.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=512", 
    description: FFaker::Lorem.paragraph
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
  if rand(0..1) == 0
    verifier_id = 1
    verified_at = Time.now
  else
    verifier_id = nil
    verified_at = nil
  end

  issue = Issue.create!(
    title: FFaker::Lorem.sentence,
    description: FFaker::Lorem.paragraph,
    started_at: Time.now,
    finished_at: nil,
    financial_cost: rand(1..2000) * 1000000000,
    procurement_url: nil,
    user_id: 1,
    verifier_id: verifier_id,
    verified_at: verified_at,
    status_id: rand(1..6)
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
    if rand(0..1) == 0
      verifier_id = 1
      verified_at = Time.now
    else
      verifier_id = nil
      verified_at = nil
    end

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
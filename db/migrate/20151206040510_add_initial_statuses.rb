class AddInitialStatuses < ActiveRecord::Migration
  def up
    Status.create(name:'Laporan/pengaduan/tertangkap tangan')
    Status.create(name:'Penyelidikan')
    Status.create(name:'Penyidikan')
    Status.create(name:'Penangkapan')
    Status.create(name:'Penahanan')
    Status.create(name:'Penggeledahan')
    Status.create(name:'Penyitaan')
    Status.create(name:'Bantuan hukum')
    Status.create(name:'Prapenuntutan dan penuntutan')
    Status.create(name:'Praperadilan')
    Status.create(name:'Sidang pengadilan')
    Status.create(name:'Selesai')
  end

  def down
    Status.delete_all
  end
end

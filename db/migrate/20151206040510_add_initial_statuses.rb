class AddInitialStatuses < ActiveRecord::Migration
  def up
    Status.create(name:'Penindakan')
    Status.create(name:'Penyelidikan')
    Status.create(name:'Penyidikan')
    Status.create(name:'Penuntutan')
    Status.create(name:'Inkracht')
    Status.create(name:'Eksekusi')
  end

  def down
    Status.delete_all
  end
end

class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.string :description
      t.string :profile_url

      t.timestamps null: false
    end
  end
end

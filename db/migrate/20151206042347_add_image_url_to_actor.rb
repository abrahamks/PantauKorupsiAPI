class AddImageUrlToActor < ActiveRecord::Migration
  def change
    add_column :actors, :image_url, :string
  end
end

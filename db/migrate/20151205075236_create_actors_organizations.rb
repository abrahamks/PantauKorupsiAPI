class CreateActorsOrganizations < ActiveRecord::Migration
  def change
    create_table :actors_organizations do |t|
    	t.references :actor
    	t.references :organization
    	t.timestamps null: false
    end
  end
end

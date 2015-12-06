class CreateActorStatuses < ActiveRecord::Migration
  def change
    create_table :actor_statuses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

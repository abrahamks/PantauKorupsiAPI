class CreateIssuesActors < ActiveRecord::Migration
  def change
    create_table :issues_actors do |t|
    	t.references :issue
    	t.references :actor
    	t.timestamps null: false
    end
  end
end

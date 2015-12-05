class CreateIssuesOrganizations < ActiveRecord::Migration
  def change
    create_table :issues_organizations do |t|
    	t.references :issue
    	t.references :organization
    	t.timestamps null: false
    end
  end
end

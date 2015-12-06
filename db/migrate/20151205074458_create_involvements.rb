class CreateInvolvements < ActiveRecord::Migration
  def change
    create_table :involvements do |t|
    	t.references :issue
    	t.references :actor
    	t.timestamps null: false
    end
  end
end

class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.datetime :started_at
      t.datetime :finished_at
      t.decimal :financial_cost
      t.string :procurement_url
      t.references :user, index: true, foreign_key: true
      t.references :verifier, references: :users, index: true, null: true
      t.datetime :verified_at
      t.datetime :started_at
      t.references :status
      t.timestamps null: false 
    end
  end
end

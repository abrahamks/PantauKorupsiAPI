class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.datetime :occured_at
      t.string :title
      t.string :summary
      t.string :url
      t.references :user, index: true, foreign_key: true
      t.references :issue, index: true, foreign_key: true
      t.datetime :verified_at
      t.references :verifier, references: :users, index: true, null: true
      t.timestamps null: false
    end

    # add_reference :feeds, :verifier, references: :users)
    # todo: (in model) belongs_to :author, class_name: "User"
  end
end

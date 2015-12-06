class Issue < ActiveRecord::Base
  belongs_to :status
  has_and_belongs_to_many :organizations
  has_many :feeds
  has_many :involvements
  accepts_nested_attributes_for :involvements
  has_many :actors, through: :involvements
  belongs_to :user
  belongs_to :verifier, :class_name => "User"
end

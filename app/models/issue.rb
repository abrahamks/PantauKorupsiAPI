class Issue < ActiveRecord::Base
  belongs_to :status
  has_and_belongs_to_many :organizations
  has_many :feeds
  has_many :involvements
  has_many :actors, through: :involvements
end

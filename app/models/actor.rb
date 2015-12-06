class Actor < ActiveRecord::Base
  has_many :involvements
  has_many :issues, through: :involvements
end

class Organization < ActiveRecord::Base
  has_and_belongs_to_many :issues
end

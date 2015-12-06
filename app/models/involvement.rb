class Involvement < ActiveRecord::Base
  belongs_to :issue
  belongs_to :actor
  belongs_to :actor_status
end

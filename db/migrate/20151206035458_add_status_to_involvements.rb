class AddStatusToInvolvements < ActiveRecord::Migration
  def change
    add_reference :involvements, :actor_status, index: true, foreign_key: true
  end
end

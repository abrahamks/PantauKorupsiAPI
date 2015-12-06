class AddInitialActorStatuses < ActiveRecord::Migration
  def up
    ActorStatus.create(name: "Saksi")
    ActorStatus.create(name: "Tersangka")
    ActorStatus.create(name: "Terdakwa")
    ActorStatus.create(name: "Terpidana")
  end

  def down
    ActorStatus.delete_all
  end
end

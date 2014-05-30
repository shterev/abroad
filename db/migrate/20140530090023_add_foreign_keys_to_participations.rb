class AddForeignKeysToParticipations < ActiveRecord::Migration
  def change
    add_foreign_key :participations, :users
    add_foreign_key :participations, :events
  end
end

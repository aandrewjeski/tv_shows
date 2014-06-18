class RemoveTelevisionShowIdFromCharacter < ActiveRecord::Migration
  def change
    remove_column :characters, :television_show_id, :integer
  end
end

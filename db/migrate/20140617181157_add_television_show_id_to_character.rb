class AddTelevisionShowIdToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :television_show_id, :integer
  end
end

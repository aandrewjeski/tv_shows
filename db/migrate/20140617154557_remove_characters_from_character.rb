class RemoveCharactersFromCharacter < ActiveRecord::Migration
  def change
    remove_column :characters, :character, :string
  end
end

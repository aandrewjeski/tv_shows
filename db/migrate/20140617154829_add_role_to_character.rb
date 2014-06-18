class AddRoleToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :role, :string, null: false
  end
end

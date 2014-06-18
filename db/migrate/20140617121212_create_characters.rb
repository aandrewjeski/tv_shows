class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :character, null: false
      t.string :name, null: false
      t.text :description
      t.integer :television_show_id, null: false
    end
  end
end

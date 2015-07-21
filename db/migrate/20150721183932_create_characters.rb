class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.references :realm, index: true, foreign_key: true
      t.string :name
      t.text :item_data

      t.timestamps null: false
    end
  end
end

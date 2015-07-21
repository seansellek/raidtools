class CreateRealms < ActiveRecord::Migration
  def change
    create_table :realms do |t|
      t.references :region, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end

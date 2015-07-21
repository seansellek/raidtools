class CreateRealms < ActiveRecord::Migration
  def change
    create_table :realms do |t|
      t.string :name
      t.string :slug
      t.string :region
    end
    add_index :realms, :name
  end
end

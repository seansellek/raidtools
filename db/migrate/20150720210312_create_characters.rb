class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :region, null: false
      t.string :server, null: false
      t.string :name, null: false
    end


  end
end

class AddRealmToCharacters < ActiveRecord::Migration
  def change
    add_reference :characters, :realm, index: true, foreign_key: true
  end
end

class AddTeamToCharacter < ActiveRecord::Migration
  def change
    add_reference :characters, :team, index: true, foreign_key: true
  end
end

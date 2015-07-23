class DropRaidTeams < ActiveRecord::Migration
  def change
    drop_table :raid_teams
  end
end

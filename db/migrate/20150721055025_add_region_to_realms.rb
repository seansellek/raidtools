class AddRegionToRealms < ActiveRecord::Migration
  def change
    remove_column :realms, :region
    add_reference :realms, :region, index: true, foreign_key: true
  end
end

class Character < ActiveRecord::Base
  belongs_to :realm
  has_one :region, through: :realm
  serialize :item_data

  def refresh_item_data
    self.item_data = BattleNetApi.get_character_data(self)
  end
end

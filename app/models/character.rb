class Character < ActiveRecord::Base
  belongs_to :realm
  belongs_to :team, class_name: 'RaidTeam'
  has_one :region, through: :realm
  #Item data is stored as a serialized hash directly from Blizzard Api.
  #Helper methods act as an iterface to parse the data on demand.
  serialize :item_data

  #Refreshes item data hash by using the Battle.net API
  def refresh_item_data!
    self.item_data = BattleNetApi.get_character_data(self)
    self.save ? true : false
  end
  #Accesses character ilvl from stored hash.
  def ilvl
    item_data['items']['averageItemLevelEquipped']
  end
  def head
    Item.new(item_data['items']['head'])
  end
  def neck
    Item.new(item_data['items']['neck'])
  end
  def shoulder
    Item.new(item_data['items']['shoulder'])
  end
  def back
    Item.new(item_data['items']['back'])
  end
  def chest
    Item.new(item_data['items']['chest'])
  end
  def wrist
    Item.new(item_data['items']['wrist'])
  end
  def hands
    Item.new(item_data['items']['hands'])
  end
  def waist
    Item.new(item_data['items']['waist'])
  end
  def legs
    Item.new(item_data['items']['legs'])
  end
  def feet
    Item.new(item_data['items']['feet'])
  end
  def finger1
    Item.new(item_data['items']['finger1'])
  end
  def finger2
    Item.new(item_data['items']['finger2'])
  end
  def trinket1
    Item.new(item_data['items']['trinket1'])
  end
  def trinket2
    Item.new(item_data['items']['trinket2'])
  end
  def mainHand
    Item.new(item_data['items']['mainHand'])
  end
  def offHand
    Item.new(item_data['items']['offHand']) if item_data['items']['offHand']
  end
  def items
    {
      head: head,
      neck: neck,
      shoulder: shoulder,
      back: back,
      chest: chest,
      wrist: wrist,
      hands: hands,
      waist: waist,
      legs: legs,
      feet: feet,
      finger1: finger1,
      finger2: finger2,
      trinket1: trinket1,
      trinket2: trinket2,
      mainHand: mainHand,
      offHand: offHand
    }
  end
end

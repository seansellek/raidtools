class Character < ActiveRecord::Base
  belongs_to :realm
  belongs_to :team
  has_one :region, through: :realm
  #Item data is stored as a serialized hash directly from Blizzard Api.
  #Helper methods act as an iterface to parse the data on demand.
  serialize :item_data

  before_save :refresh_item_data

  #Refreshes item data hash by using the Battle.net API
  def refresh_item_data
    self.item_data = BattleNetApi.get_character_data(self) 
    #self.save ? true : false
  end
  def refresh_item_data!
    refresh_item_data
    self.save
  end
  #Accesses character ilvl from stored hash.
  def ilvl
    item_data['items']['averageItemLevelEquipped']
  end

  [:head,:neck,:shoulder,:back,:chest,
  :wrist,:hands,:waist,:legs,:feet,
  :finger1,:finger2,:trinket1,:trinket2,:mainHand,
  :offHand].each do |sym|
    define_method sym do 
     Item.new(item_data['items'][sym.to_s])
    end
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

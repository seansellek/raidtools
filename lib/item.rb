#Instances of Item are built in helper methods on Character model.
#It is used to retrieve item data as needed.
#Add methods here to expose more of an item's data.
class Item
  attr_reader :id, :ilvl, :tooltipParams, :bonuses, :enchant
  def initialize (item_hash)
    @id = item_hash['id']
    @ilvl = item_hash['itemLevel']
    @bonuses = item_hash['bonusLists']
    @enchant = item_hash['tooltipParams']['enchant'] || false
    @item_hash = item_hash

  end

  def has_gem_slot?
    !(@bonuses & [564,565]).empty?
  end

  def gem
    if self.has_gem_slot?
      @item_hash['tooltipParams']['gem0']
    else
      nil
    end
  end

  def set
    if @item_hash['tooltipParams'].has_key?('set')
      @item_hash['tooltipParams']['set']
    else
      nil
    end
  end

end

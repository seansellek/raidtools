module ApplicationHelper
  def tooltip_for item, text=nil
    if item
      output = '<a href="https://wod.wowhead.com/item='
      output << item.id.to_s
      output << '" rel="bonus=' + item.bonuses.join(':').to_s
      output << '&gems=' + item.gem.to_s if item.gem
      output << '&pcs=' + item.set.join(':') if item.set
      output << '&ench=' + item.enchant.to_s if item.enchant
      output << '">'
      output << (text || item.ilvl.to_s)
      output << '</a>'
    else
      output = text ? text : '-'
    end
    output
  end

end

module ApplicationHelper
  def tooltip_for item, text=nil
    if item
      output = '<a href="https://wod.wowhead.com/item='
      output << item.id.to_s
      output << '" rel="bonus='
      output << item.bonuses.join(':').to_s
      output << '">'
      output << (text || item.ilvl.to_s)
      output << '</a>'
    else
      output = text ? text : 0
    end
    output
  end

end

class Team < ActiveRecord::Base
  has_many :characters

  def ilvl
    self.characters.map{|c| c.ilvl}.inject(:+) / self.characters.length.to_f
  end

end

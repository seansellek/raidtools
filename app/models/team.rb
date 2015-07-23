class Team < ActiveRecord::Base
  has_many :characters
  accepts_nested_attributes_for :characters, :reject_if => :all_blank, :allow_destroy => true

  def ilvl
    self.characters.map{|c| c.ilvl}.inject(:+) / self.characters.length.to_f
  end

end

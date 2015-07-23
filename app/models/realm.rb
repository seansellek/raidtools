class Realm < ActiveRecord::Base
  belongs_to :region
  has_many :characters

  def label
    name + '-' + region.name
  end
end

class Realm < ActiveRecord::Base
  belongs_to :region
  has_many :characters
  validates :name, presence: true
  validates :region, presence: true
end

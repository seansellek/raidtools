class Character < ActiveRecord::Base
  has_one :realm
  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 12 }
  validates :region, inclusion: { in: %w(US EU) }

end

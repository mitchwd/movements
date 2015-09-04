class Location < ActiveRecord::Base
  has_many :movements
  has_many :people, through: :movements

  validates_presence_of :name
  validates :capacity,
    numericality: { greater_than_or_equal_to: 1, allow_blank: true}
end

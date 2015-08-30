class Location < ActiveRecord::Base
  validates_presence_of :name, :current_capacity
  validates :capacity,
    numericality: { greater_than_or_equal_to: 1, allow_blank: true}
  validates :current_capacity,
    presence: true,
    numericality: { greater_than_or_equal_to: 0}
    #TODO Validate that current_capacity is less than maximum capacity.
end

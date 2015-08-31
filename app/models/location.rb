class Location < ActiveRecord::Base
  has_many :movements
  has_many :people, :through => :movements

  validates_presence_of :name
  validates :capacity,
    numericality: { greater_than_or_equal_to: 1, allow_blank: true}
  validates :current_capacity,
    presence: true,
    numericality: { greater_than_or_equal_to: 0}
  validate :current_capacity_cannot_be_more_than_capacity, unless: "capacity.nil?"

  def current_capacity_cannot_be_more_than_capacity
    errors.add(:current_capacity, 'must be less than or equal to capacity') if current_capacity.to_i > capacity
  end
end

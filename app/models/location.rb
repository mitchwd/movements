class Location < ActiveRecord::Base
  include AlgoliaSearch

  algoliasearch do
    attribute :name
  end

  has_many :movements
  has_many :people, -> { uniq }, through: :movements

  validates_presence_of :name
  validates :capacity,
    numericality: { greater_than_or_equal_to: 1, allow_blank: true}
end

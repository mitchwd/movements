class Movement < ActiveRecord::Base
  # If changing sort order, also change @person.location finder (in person model)
  default_scope { order(created_at: :desc)}

  belongs_to :person
  belongs_to :location

  validates_associated :person, :location
  validates_presence_of :person, :location
end

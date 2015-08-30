class Identifier < ActiveRecord::Base
  belongs_to :person

  default_scope { order(code: :asc) }

  validates_associated :person
  validates_presence_of :person, :code
  validates_uniqueness_of :code
end

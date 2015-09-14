class Identifier < ActiveRecord::Base
  include AlgoliaSearch

  algoliasearch do
    attribute :code, :person_name
  end

  belongs_to :person

  default_scope { order(code: :asc) }

  validates_associated :person
  validates_presence_of :person, :code
  validates_uniqueness_of :code

  def person_name
    self.person.fullname
  end
end

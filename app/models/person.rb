class Person < ActiveRecord::Base
  require 'csv'
  include AlgoliaSearch

  algoliasearch do
    attribute :first_name, :last_name, :fullname, :school_identifier
  end

  has_many :identifiers, inverse_of: :person, dependent: :destroy
  has_many :movements
  has_many :locations, through: :movements

  def location
    self.movements.last.location
  end

  default_scope { order(last_name: :asc)}

  validates_presence_of :first_name, :last_name, :on => :create, :message => "can't be blank"

  accepts_nested_attributes_for :identifiers, reject_if: :all_blank, allow_destroy: true

  def fullname
    first_name + " " + last_name
  end

  # CSV Import/Export
  def self.as_csv
    # Export CSV
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    # Import CSV with headers
    CSV.foreach(file.path, headers: true) do |row|
      person_hash = row.to_hash
      person = Person.where(id: person_hash["id"])

      if person.count == 1
        person.first.update_attributes(person_hash)
      else
        Person.create!(person_hash)
      end
    end
  end

end

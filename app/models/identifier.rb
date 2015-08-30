class Identifier < ActiveRecord::Base
  belongs_to :person

  validates_associated :person, :on => :create, :message => "must be a valid person"
  validates_presence_of :person, :code, :on => :create, :message => "can't be blank"
end

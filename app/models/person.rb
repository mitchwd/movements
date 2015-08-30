class Person < ActiveRecord::Base
  has_many :identifiers, dependent: :destroy

  default_scope { order(last_name: :asc)}

  validates_presence_of :first_name, :last_name, :on => :create, :message => "can't be blank"

  def fullname
    first_name + " " + last_name
  end
end

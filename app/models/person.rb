class Person < ActiveRecord::Base
  default_scope { order(last_name: :asc)}

  validates_presence_of :first_name, :last_name, :on => :create, :message => "can't be blank"
end

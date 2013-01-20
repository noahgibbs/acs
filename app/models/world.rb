class World < ActiveRecord::Base
  attr_accessible :author_email, :author_name, :description, :name
end

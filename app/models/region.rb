class Region < ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :world
  has_many :rooms
end

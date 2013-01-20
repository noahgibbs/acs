class RoomType < ActiveRecord::Base
  attr_accessible :name, :json_data

  has_many :rooms
end

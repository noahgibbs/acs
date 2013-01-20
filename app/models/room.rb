class Room < ActiveRecord::Base
  attr_accessible :json_data, :name, :room_type
end

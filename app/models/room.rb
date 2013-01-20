class Room < ActiveRecord::Base
  attr_accessible :json_data, :name, :room_type_id, :region_id

  belongs_to :room_type
  belongs_to :region

  include TextTransform

  def to_param
    id_and_name_to_param(id, name)
  end
end

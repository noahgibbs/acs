require "text_transform"

class World < ActiveRecord::Base
  attr_accessible :author_email, :author_name, :description, :name, :is_default, :start_region_id
  include TextTransform

  has_one :server_status
  has_many :regions

  def to_param
    id_and_name_to_param(id, name)
  end
end

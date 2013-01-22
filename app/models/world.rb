require "text_transform"

class World < ActiveRecord::Base
  attr_accessible :author_email, :author_name, :description, :name, :is_default
  include TextTransform

  has_one :server_status
  has_one :start_region, :class_name => :region

  def to_param
    id_and_name_to_param(id, name)
  end
end

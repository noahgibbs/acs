class TerrainSet < ActiveRecord::Base
  has_many :terrains

  accepts_nested_attributes_for :terrains
end

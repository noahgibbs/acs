class TerrainSet < ActiveRecord::Base
  has_many :terrains

  accepts_nested_attributes_for :terrains,
    :reject_if => proc do |attrs|
      attrs.slice(:passibility, :game_image_id, :name).values.each do |v|
        v.nil? || v.empty?
      end
    end
end

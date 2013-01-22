class ServerStatus < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :world
end

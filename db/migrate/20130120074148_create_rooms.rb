class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name, :length => 60
      t.int :room_type_id
      t.int :region_id
      t.text :json_data

      t.timestamps
    end
  end
end

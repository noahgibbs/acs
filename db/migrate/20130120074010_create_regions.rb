class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name, :length => 60
      t.text :description
      t.int :world_id

      t.timestamps
    end
  end
end

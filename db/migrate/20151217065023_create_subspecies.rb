class CreateSubspecies < ActiveRecord::Migration
  def change
    create_table :subspecies do |t|
      t.string :name
      t.integer :species_id

      t.timestamps
    end
  end
end

class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string :name
      t.integer :taxonomy_id

      t.timestamps
    end
  end
end

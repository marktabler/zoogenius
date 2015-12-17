class CreateTaxonomies < ActiveRecord::Migration
  def change
    create_table :taxonomies do |t|
      t.string :genus
      t.string :family
      t.string :order
      t.string :tclass
      t.string :phylum

      t.timestamps
    end
  end
end

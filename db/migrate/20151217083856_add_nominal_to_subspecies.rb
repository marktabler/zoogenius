class AddNominalToSubspecies < ActiveRecord::Migration
  def change
    add_column :subspecies, :nominal, :boolean
  end
end

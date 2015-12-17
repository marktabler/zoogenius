class AddNominalToSubspecies < ActiveRecord::Migration
  def change
    add_column :subspecies, :nominal, :boolean, default: false
  end
end

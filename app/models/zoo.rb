class Zoo < ActiveRecord::Base
  has_many :animals

  def unique_species_count
    Species.where("id in (?)", animals.includes(:subspecies).pluck("subspecies.species_id")).uniq.count
    # animals.pluck(:subspecies_id).uniq.count
  end

end

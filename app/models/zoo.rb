class Zoo < ActiveRecord::Base
  has_many :animals

  def unique_species_count
    animals.where(classification_type: "Species").pluck(:classification_id).uniq.count
  end

  def unique_subspecies_count
    animals.where(classification_type: "Subspecies").pluck(:classification_id).uniq.count
  end

  # An animal is a unique attraction if its species is not represented
  # elsewhere in the zoo's catalog. For example Canis Lupus Familiaris 
  # and Canis Lupus Dingo are unique subspecies, but both represent the
  # species Canis Lupus, and so are together a single "attraction." 
  def unique_attraction_count
    animals.includes(:classification).map(&:species).uniq.count
  end
end

class Animal < ActiveRecord::Base
  belongs_to :zoo
  belongs_to :classification, polymorphic: true
  
  def taxonomy
    classification.taxonomy
  end

  def subspecies?
    classification_type == "Subspecies"
  end

  def species
    if subspecies?
      classification.species
    else
      classification
    end
  end
  
  def scientific_name
    if subspecies?
      [species.taxonomy.genus, species.name, classification.name].join(" ")
    else
      [species.taxonomy.genus, species.name].join(" ")
    end
  end
  
end

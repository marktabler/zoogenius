class Animal < ActiveRecord::Base
  belongs_to :zoo
  belongs_to :subspecies
  delegate :species, to: :subspecies
  delegate :taxonomy, to: :species
  
  def name_type
    if subspecies.nominal?
      "Binomial"
    else
      "Trinomial"
    end
  end

  def scientific_name
    [species.taxonomy.genus, species.name, subspecies.name].join(" ").strip
  end
  
end

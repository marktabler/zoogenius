class Animal < ActiveRecord::Base
  belongs_to :zoo
  belongs_to :subspecies
  delegate :species, to: :subspecies
  delegate :taxonomy, to: :species
  

  def scientific_name
    [species.taxonomy.genus, species.name, subspecies.display_name].join(" ").strip
  end
  
end

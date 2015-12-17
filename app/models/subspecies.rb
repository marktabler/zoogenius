class Subspecies < ActiveRecord::Base
  has_many :animals, as: :classification
  belongs_to :species

  def taxonomy
    species.taxonomy
  end
  
end

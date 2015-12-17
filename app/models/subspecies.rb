class Subspecies < ActiveRecord::Base
  has_many :animals
  belongs_to :species
  
  scope :named, -> { where(nominal: false) }
  scope :nominal, -> { where(nominal: true) }
  
  def taxonomy
    species.taxonomy
  end

end

class Species < ActiveRecord::Base
  has_many :animals
  has_many :subspecies, class_name: Subspecies
  belongs_to :taxonomy

end

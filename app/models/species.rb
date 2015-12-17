class Species < ActiveRecord::Base
  has_many :animals, as: :classification
  has_many :subspecies
  belongs_to :taxonomy

end

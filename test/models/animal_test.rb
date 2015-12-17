require 'test_helper'

class AnimalTest < ActiveSupport::TestCase
  test "trinomial name" do
    taxonomy = Taxonomy.create(genus: "Canis", family: "Canidae")
    species = Species.create(name: "Lupus", taxonomy_id: taxonomy.id)
    subspecies = Subspecies.create(name: "Familiaris", species_id: species.id)
    subject = Animal.create(name: "Dog", subspecies: subspecies)
    assert subject.scientific_name == "Canis Lupus Familiaris", "Expected Canis Lupus Familiaris but got #{subject.scientific_name}"
  end

  test "binomial name" do
    taxonomy = Taxonomy.create(genus: "Canis", family: "Canidae")
    species = Species.create(name: "Lupus", taxonomy_id: taxonomy.id)
    subspecies = Subspecies.create(name: "Familiaris", species_id: species.id)
    nominal_subspecies = Subspecies.create(name: "", species_id: species.id, nominal: true)
    subject = Animal.create(name: "Grey Wolf", subspecies: nominal_subspecies)
    assert subject.scientific_name == "Canis Lupus", "Expected Canis Lupus but got #{subject.scientific_name}"
  end
end

require 'test_helper'

class ZooTest < ActiveSupport::TestCase
  setup do
    taxonomy = Taxonomy.create(genus: "Canis", family: "Canidae")
    species = Species.create(name: "Lupus", taxonomy_id: taxonomy.id)
    familiaris = Subspecies.create(name: "Familiaris", species_id: species.id)
    dingo = Subspecies.create(name: "Dingo", species_id: species.id)
    pet_dog = Animal.create(name: "Dog", classification: familiaris)
    pet_dingo = Animal.create(name: "Dingo", classification: dingo)
    grey_wolf = Animal.create(name: "Grey Wolf", classification: species)
    zoo = Zoo.new(name: "Test Zoo")
    zoo.animals << [pet_dingo, pet_dog, grey_wolf]
    zoo.save
  end

  test "offers count of unique species" do
    zoo = Zoo.find_by_name("Test Zoo")
    assert zoo.unique_species_count == 1
  end

  test "offers count of unique subspecies" do
    zoo = Zoo.find_by_name("Test Zoo")
    assert zoo.unique_subspecies_count == 2
  end

  test "offers count of unique attractions" do
    zoo = Zoo.find_by_name("Test Zoo")
    assert zoo.unique_attraction_count == 1
  end

  teardown do
  end
end

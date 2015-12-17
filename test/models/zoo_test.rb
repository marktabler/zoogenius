require 'test_helper'

class ZooTest < ActiveSupport::TestCase
  setup do
    taxonomy = Taxonomy.create(genus: "Canis", family: "Canidae")
    species = Species.create(name: "Lupus", taxonomy_id: taxonomy.id)
    familiaris = Subspecies.create(name: "Familiaris", species_id: species.id)
    dingo = Subspecies.create(name: "Dingo", species_id: species.id)
    nominal = Subspecies.create(name: "", species_id: species.id, nominal: true)
    pet_dog = Animal.create(name: "Dog", subspecies: familiaris)
    pet_dingo = Animal.create(name: "Dingo", subspecies: dingo)
    grey_wolf = Animal.create(name: "Grey Wolf", subspecies: nominal)
    zoo = Zoo.new(name: "Test Zoo")
    zoo.animals << [pet_dingo, pet_dog, grey_wolf]
    zoo.save
  end

  test "offers count of unique species" do
    zoo = Zoo.find_by_name("Test Zoo")
    puts zoo.unique_species_count
    assert zoo.unique_species_count == 1
  end


  teardown do
  end
end

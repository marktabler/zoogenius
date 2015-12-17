# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dog = Animal.create(name: "Fido", subspecies:
  Subspecies.create(name: "Familiaris", species:
    Species.create(name: "Lupus", taxonomy:
      Taxonomy.create(genus: "Canis", family: "Canidae", order: "Carnivora", tclass: "Mammalia", phylum: "Cordata")
    )
  )
)

wolf = Animal.create(name: "Ram Alpha", subspecies: Subspecies.create(nominal: true, species: Species.find_by_name("Lupus")))
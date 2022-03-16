# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying pokemons ..."
Pokemon.destroy_all
puts "Pokemons destroyed !"
puts "Creating Pokemons..."
6.times do |i|
  pokemon_api = JSON.parse(URI.open("https://pokeapi.co/api/v2/pokemon/#{i+1}").read)
  if pokemon_api['types'].length == 1
    Pokemon.create(
      name: pokemon_api['name'],
      base_experience: pokemon_api['base_experience'],
      height: pokemon_api['height'],
      weight: pokemon_api['weight'],
      is_default: pokemon_api['is_default'],
      order: pokemon_api['order'],
      api_id: pokemon_api['id'],
      species_id: pokemon_api['id'],
      front_default: pokemon_api['sprites']['front_default'],
      front_shiny: pokemon_api['sprites']['front_shiny'],
      official_artwork: pokemon_api['sprites']['other']['official-artwork']['front_default'],
      type_1: pokemon_api['types'][0]['type']['name']
    )
  else
    Pokemon.create(
      name: pokemon_api['name'],
      base_experience: pokemon_api['base_experience'],
      height: pokemon_api['height'],
      weight: pokemon_api['weight'],
      is_default: pokemon_api['is_default'],
      order: pokemon_api['order'],
      api_id: pokemon_api['id'],
      species_id: pokemon_api['id'],
      front_default: pokemon_api['sprites']['front_default'],
      front_shiny: pokemon_api['sprites']['front_shiny'],
      official_artwork: pokemon_api['sprites']['other']['official-artwork']['front_default'],
      type_1: pokemon_api['types'][0]['type']['name'],
      type_2: pokemon_api['types'][1]['type']['name']
    )
  end
end
puts "Pokemons created !"

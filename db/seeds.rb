# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Pokemon.count != 18
  puts "Destroying pokemons ..."
  Pokemon.destroy_all
  puts "Pokemons destroyed !"
  puts "Creating Pokemons..."
  18.times do |i|
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
end

if Type.count != 18
  puts "Destroying types..."
  Type.destroy_all
  puts "Types destroyed !"
  puts "Creating types..."
  18.times do |i|
    types_api = JSON.parse(URI.open("https://pokeapi.co/api/v2/type/#{i+1}").read)
    Type.create(
      name: types_api['name'],
      double_damage_from: types_api['damage_relations']['double_damage_from'],
      double_damage_to: types_api['damage_relations']['double_damage_to'],
      half_damage_from: types_api['damage_relations']['half_damage_from'],
      half_damage_to: types_api['damage_relations']['half_damage_to'],
      no_damage_from: types_api['damage_relations']['no_damage_from'],
      no_damage_to: types_api['damage_relations']['no_damage_to']
    )
  end
  puts "Types created !"
end

if Stat.count != 8
  puts "Destroying stats..."
  Stat.destroy_all
  puts "Stats destroyed !"
  puts "Creating stats..."
  8.times do |i|
    stats_api = JSON.parse(URI.open("https://pokeapi.co/api/v2/stat/#{i+1}").read)
    Stat.create(
      name: stats_api["name"]
    )
  end
end

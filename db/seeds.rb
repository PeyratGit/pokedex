# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Species.count != 6
  puts "Destroying species..."
  Species.destroy_all
  puts "Species destroyed !"
  puts "Creating species..."
  6.times do |i|
    specie_api = JSON.parse(URI.open("https://pokeapi.co/api/v2/pokemon-species/#{i+1}").read)
    Species.create(
      name: specie_api['name'],
      base_happiness: specie_api['base_happiness'],
      capture_rate: specie_api['capture_rate'],
      forms_switchable: specie_api['forms_switchable'],
      gender_rate: specie_api['gender_rate'],
      has_gender_differences: specie_api['has_gender_differences'],
      hatch_counter: specie_api['hatch_counter'],
      api_id: specie_api['id'],
      is_baby: specie_api['is_baby'],
      is_legendary: specie_api['is_legendary'],
      is_mythical: specie_api['is_mythical'],
      order: specie_api['order']
    )
  end
  puts "Species created !"
end

if Pokemon.count != 6
  puts "Destroying pokemons ..."
  Pokemon.destroy_all
  puts "Pokemons destroyed !"
  puts "Creating Pokemons..."
  6.times do |i|
    pokemon_api = JSON.parse(URI.open("https://pokeapi.co/api/v2/pokemon/#{i+1}").read)
    increased_i = i + 1
    if pokemon_api['sprites']['front_female'].nil?
      if pokemon_api['types'].length == 1
        Pokemon.create(
          name: pokemon_api['name'],
          base_experience: pokemon_api['base_experience'],
          height: pokemon_api['height'],
          weight: pokemon_api['weight'],
          is_default: pokemon_api['is_default'],
          order: pokemon_api['order'],
          api_id: pokemon_api['id'],
          species_id: Species.find_by(api_id: increased_i).id,
          front_default: pokemon_api['sprites']['front_default'],
          front_shiny: pokemon_api['sprites']['front_shiny'],
          back_default: pokemon_api['sprites']['back_default'],
          back_shiny: pokemon_api['sprites']['back_shiny'],
          home_front_default: pokemon_api['sprites']['other']['home']['front_default'],
          home_front_shiny: pokemon_api['sprites']['other']['home']['front_shiny'],
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
          species_id: Species.find_by(api_id: increased_i).id,
          front_default: pokemon_api['sprites']['front_default'],
          front_shiny: pokemon_api['sprites']['front_shiny'],
          back_default: pokemon_api['sprites']['back_default'],
          back_shiny: pokemon_api['sprites']['back_shiny'],
          home_front_default: pokemon_api['sprites']['other']['home']['front_default'],
          home_front_shiny: pokemon_api['sprites']['other']['home']['front_shiny'],
          official_artwork: pokemon_api['sprites']['other']['official-artwork']['front_default'],
          type_1: pokemon_api['types'][0]['type']['name'],
          type_2: pokemon_api['types'][1]['type']['name']
        )
      end
    else
      if pokemon_api['types'].length == 1
        Pokemon.create(
          name: pokemon_api['name'],
          base_experience: pokemon_api['base_experience'],
          height: pokemon_api['height'],
          weight: pokemon_api['weight'],
          is_default: pokemon_api['is_default'],
          order: pokemon_api['order'],
          api_id: pokemon_api['id'],
          species_id: Species.find_by(api_id: increased_i).id,
          front_default: pokemon_api['sprites']['front_default'],
          front_shiny: pokemon_api['sprites']['front_shiny'],
          front_female: pokemon_api['sprites']['front_female'],
          front_shiny_female: pokemon_api['sprites']['front_shiny_female'],
          back_default: pokemon_api['sprites']['back_default'],
          back_female: pokemon_api['sprites']['back_female'],
          back_shiny: pokemon_api['sprites']['back_shiny'],
          back_shiny_female: pokemon_api['sprites']['back_shiny_female'],
          home_front_default: pokemon_api['sprites']['other']['home']['front_default'],
          home_front_female: pokemon_api['sprites']['other']['home']['front_female'],
          home_front_shiny: pokemon_api['sprites']['other']['home']['front_shiny'],
          home_front_shiny_female: pokemon_api['sprites']['other']['home']['front_shiny_female'],
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
          species_id: Species.find_by(api_id: increased_i).id,
          front_default: pokemon_api['sprites']['front_default'],
          front_shiny: pokemon_api['sprites']['front_shiny'],
          front_female: pokemon_api['sprites']['front_female'],
          front_shiny_female: pokemon_api['sprites']['front_shiny_female'],
          back_default: pokemon_api['sprites']['back_default'],
          back_female: pokemon_api['sprites']['back_female'],
          back_shiny: pokemon_api['sprites']['back_shiny'],
          back_shiny_female: pokemon_api['sprites']['back_shiny_female'],
          home_front_default: pokemon_api['sprites']['other']['home']['front_default'],
          home_front_female: pokemon_api['sprites']['other']['home']['front_female'],
          home_front_shiny: pokemon_api['sprites']['other']['home']['front_shiny'],
          home_front_shiny_female: pokemon_api['sprites']['other']['home']['front_shiny_female'],
          official_artwork: pokemon_api['sprites']['other']['official-artwork']['front_default'],
          type_1: pokemon_api['types'][0]['type']['name'],
          type_2: pokemon_api['types'][1]['type']['name']
        )
      end
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
  puts "Stats created !"
end

if PokemonStat.count != (Pokemon.count * 6)
  puts "Destroying pokemon stats..."
  PokemonStat.destroy_all
  puts "Pokemon stats destroyed !"
  puts "Creating pokemon stats..."
  Pokemon.all.each do |pokemon|
    pokemon_api = JSON.parse(URI.open("https://pokeapi.co/api/v2/pokemon/#{pokemon.api_id}").read)
    @stats = Stat.all
    6.times do |i|
      # puts "Pokemon id : #{pokemon.id}"
      # puts "Stat id : #{@stats[i].id}"
      # puts "Base stat : #{pokemon_api['stats'][i]['base_stat']}"
      # puts "Effort : #{pokemon_api['stats'][i]['effort']}"
      PokemonStat.create(
        pokemon_id: pokemon.id,
        stat_id: @stats[i].id,
        base_stat: pokemon_api['stats'][i]['base_stat'],
        effort: pokemon_api['stats'][i]['effort']
      )
    end
  end
  puts "Pokemon stats created !"
end

if SpeciesFlavorText.count != Species.count
  puts "Destroying flavor texts..."
  SpeciesFlavorText.destroy_all
  puts "Creating flavor texts..."
  Species.count.times do |i|
    specie_api = JSON.parse(URI.open("https://pokeapi.co/api/v2/pokemon-species/#{i+1}/").read)
    SpeciesFlavorText.create(
      species_id: Species.find_by(api_id: (i + 1)).id,
      flavor_text: specie_api['flavor_text_entries'][0]['flavor_text']
    )
  end
  puts "Flavor texts created !"
end

if Ability.count != 267
  puts "Creating Abilities..."
  267.times do |i|
    ability_api = JSON.parse(URI.open("https://pokeapi.co/api/v2/ability/#{i+1}").read)
    Ability.create(
      name: ability_api['name'],
      is_main_series: ability_api['is_main_series'],
      api_id: ability_api["id"]
    )
  end
  puts "Abilities created !"
end

if PokemonAbility.count != (Pokemon.count * 2)
  puts "Creating pokemon abilities..."
  Pokemon.all.each do |pokemon|
    puts "This is the pokemon : name : #{pokemon.name}, api_id : #{pokemon.api_id}"
    pokemon_api = JSON.parse(URI.open("https://pokeapi.co/api/v2/pokemon/#{pokemon.api_id}/").read)
    puts "Here's the api : #{pokemon_api["abilities"]}"
    puts "Here's the ability id : #{pokemon_api["abilities"][0]["ability"]["url"].match(/\d{2,3}/)[0].to_i}"
    puts "Here's the hidden : #{pokemon_api["abilities"][0]["is_hidden"]}"
    puts "Here's the slot : #{pokemon_api["abilities"][0]["slot"]}"
    PokemonAbility.create(
      pokemon_id: pokemon.id,
      ability_id: Ability.find(pokemon_api["abilities"][0]["ability"]["url"].match(/\d{2,3}/)[0].to_i).id,
      is_hidden: pokemon_api["abilities"][0]["is_hidden"],
      slot: pokemon_api["abilities"][0]["slot"]
    )
    PokemonAbility.create(
      pokemon_id: pokemon.id,
      ability_id: Ability.find(pokemon_api["abilities"][1]["ability"]["url"].match(/\d{2,3}/)[0].to_i).id,
      is_hidden: pokemon_api["abilities"][1]["is_hidden"],
      slot: pokemon_api["abilities"][1]["slot"]
    )
  end
  puts "Pokemon abilities created !"
end

class Species < ApplicationRecord
  has_many :pokemons
  has_many :species_flavor_texts
end

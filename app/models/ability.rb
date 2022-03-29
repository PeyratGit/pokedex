class Ability < ApplicationRecord
  has_many :pokemon_abilities
  delegate :pokemon, to: :pokemon_abilities, allow_nil: true
end

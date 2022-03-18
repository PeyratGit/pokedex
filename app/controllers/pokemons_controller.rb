class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    require 'open-uri'
    @pokemon = Pokemon.find(params[:id])
    @type1 = Type.find_by(name: @pokemon.type_1)
    @type2 = Type.find_by(name: @pokemon.type_2)
  end
end

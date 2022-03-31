class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
    if params[:query].present?
      @pokemons = @pokemons.where('name ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'list.html', locals: { pokemons: @pokemons } }
    end
  end

  def show
    require 'open-uri'
    @pokemon = Pokemon.find(params[:id])
    @type1 = Type.find_by(name: @pokemon.type_1)
    @type2 = Type.find_by(name: @pokemon.type_2)
  end
end

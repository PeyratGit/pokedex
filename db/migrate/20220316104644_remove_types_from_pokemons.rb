class RemoveTypesFromPokemons < ActiveRecord::Migration[6.1]
  def change
    remove_column :pokemons, :types, :string
  end
end

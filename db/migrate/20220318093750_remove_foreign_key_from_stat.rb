class RemoveForeignKeyFromStat < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :stats, :pokemons
  end
end

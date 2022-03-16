class AddType2ToPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :type_2, :string
  end
end

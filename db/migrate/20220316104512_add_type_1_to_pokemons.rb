class AddType1ToPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :pokemons, :type_1, :string
  end
end

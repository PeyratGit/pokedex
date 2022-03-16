class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :base_experience
      t.integer :height
      t.integer :weight
      t.boolean :is_default
      t.integer :order
      t.integer :api_id
      t.string :species_id

      t.timestamps
    end
  end
end

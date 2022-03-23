class CreateSpeciesFlavorTexts < ActiveRecord::Migration[6.1]
  def change
    create_table :species_flavor_texts do |t|
      t.references :species, null: false, foreign_key: true
      t.text :flavor_text

      t.timestamps
    end
  end
end

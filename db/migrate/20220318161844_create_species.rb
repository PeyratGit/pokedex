class CreateSpecies < ActiveRecord::Migration[6.1]
  def change
    create_table :species do |t|
      t.string :name
      t.integer :base_happiness
      t.integer :capture_rate
      t.boolean :forms_switchable
      t.integer :gender_rate
      t.boolean :has_gender_differences
      t.integer :hatch_counter
      t.integer :api_id
      t.boolean :is_baby
      t.boolean :is_legendary
      t.boolean :is_mythical
      t.integer :order

      t.timestamps
    end
  end
end

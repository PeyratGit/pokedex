class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.string :name
      t.text :double_damage_from, array: true, default: []
      t.text :double_damage_to, array: true, default: []
      t.text :half_damage_from, array: true, default: []
      t.text :half_damage_to, array: true, default: []
      t.text :no_damage_from, array: true, default: []
      t.text :no_damage_to, array: true, default: []

      t.timestamps
    end
  end
end

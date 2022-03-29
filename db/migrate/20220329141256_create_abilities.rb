class CreateAbilities < ActiveRecord::Migration[6.1]
  def change
    create_table :abilities do |t|
      t.string :name
      t.integer :generation_id
      t.boolean :is_main_series

      t.timestamps
    end
  end
end

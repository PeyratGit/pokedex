class AddApiIdToAbilities < ActiveRecord::Migration[6.1]
  def change
    add_column :abilities, :api_id, :integer
  end
end

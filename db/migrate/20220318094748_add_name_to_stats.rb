class AddNameToStats < ActiveRecord::Migration[6.1]
  def change
    add_column :stats, :name, :string
  end
end

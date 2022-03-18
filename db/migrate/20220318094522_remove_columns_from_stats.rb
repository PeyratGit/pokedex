class RemoveColumnsFromStats < ActiveRecord::Migration[6.1]
  def change
    remove_column :stats, :hp
    remove_column :stats, :attack
    remove_column :stats, :defense
    remove_column :stats, :special_attack
    remove_column :stats, :special_defense
    remove_column :stats, :speed
  end
end

class DropTypesTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :types
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

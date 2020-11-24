class RenameColumnFirtName < ActiveRecord::Migration[6.0]
  def change
    rename_column :influencers, :firt_name, :first_name
  end
end

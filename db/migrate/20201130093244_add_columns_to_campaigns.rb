class AddColumnsToCampaigns < ActiveRecord::Migration[6.0]
  def change
    add_column :campaigns, :lifestyle, :boolean
    add_column :campaigns, :sport, :boolean
    add_column :campaigns, :food, :boolean
    add_column :campaigns, :gaming, :boolean
    add_column :campaigns, :healthy, :boolean
    add_column :campaigns, :travel, :boolean
    add_column :campaigns, :music, :boolean
    add_column :campaigns, :fashion, :boolean
    add_column :campaigns, :art, :boolean
    add_column :campaigns, :technology, :boolean
    add_column :campaigns, :humour, :boolean
    add_column :campaigns, :beauty, :boolean
  end
end

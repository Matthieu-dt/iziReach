class AddFiltersToInfluencers < ActiveRecord::Migration[6.0]
  def change
    add_column :influencers, :lifestyle, :boolean
    add_column :influencers, :sport, :boolean
    add_column :influencers, :food, :boolean
    add_column :influencers, :gaming, :boolean
    add_column :influencers, :healthy, :boolean
    add_column :influencers, :travel, :boolean
    add_column :influencers, :music, :boolean
    add_column :influencers, :fashion, :boolean
    add_column :influencers, :art, :boolean
    add_column :influencers, :technology, :boolean
    add_column :influencers, :humour, :boolean
    add_column :influencers, :beauty, :boolean
  end
end

class AddColumnsToInfluencers < ActiveRecord::Migration[6.0]
  def change
    add_column :influencers, :fullname, :string
    add_column :influencers, :followers, :string
    add_column :influencers, :engagement, :string
    add_column :influencers, :instagram_pp, :string
  end
end

class AddColumnRatingToInfluencers < ActiveRecord::Migration[6.0]
  def change
    add_column :influencers, :rating, :integer
  end
end

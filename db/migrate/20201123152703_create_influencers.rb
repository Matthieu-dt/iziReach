class CreateInfluencers < ActiveRecord::Migration[6.0]
  def change
    create_table :influencers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :firt_name
      t.string :last_name
      t.string :user_name
      t.text   :description
      t.integer :price_per_story
      t.integer :price_per_photo
      t.integer :price_per_video
      t.integer :price_per_live

      t.timestamps
    end
  end
end

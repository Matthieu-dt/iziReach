class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :target
      t.datetime :occurs_at
      t.string :status
      t.integer :number_of_stories
      t.integer :number_of_photos
      t.integer :number_of_videos
      t.integer :number_of_lives

      t.timestamps
    end
  end
end

class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.text :values
      t.string :url

      t.timestamps
    end
  end
end

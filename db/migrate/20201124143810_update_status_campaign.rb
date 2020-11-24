class UpdateStatusCampaign < ActiveRecord::Migration[6.0]
  def change
    change_column :campaigns, :status, :string, default: "pending"
  end
end

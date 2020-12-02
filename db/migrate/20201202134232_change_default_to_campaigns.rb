class ChangeDefaultToCampaigns < ActiveRecord::Migration[6.0]
    def change
      change_column :campaigns, :status, :string, default: "ongoing"
    end
end

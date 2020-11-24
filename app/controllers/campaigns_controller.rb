class CampaignsController < ApplicationController


  def show
    @campaign = Campaign.find(params[:id])
    authorize @campaign
  end

  def new
    @company = Company.find(params[:company_id])
    @campaign = Campaign.new
    @campaign.company = @company
    authorize @campaign
  end
  
  def create
    @company = Company.find(params[:company_id])
    @campaign = Campaign.new(campaign_params)
    @campaign.company = @company
    authorize @campaign
    if @campaign.save!
        redirect_to campaign_path(@campaign)
    else
        render :new
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @campaign = Campaign.find(params[:id])
    authorize @compaign
    @campaign.update(campaign_params)
    redirect_to campaign_path(@campaign)
  end

private

def campaign_params
    params.require(:campaign).permit(:name, :description, :target, :occurs_at, :status, :number_of_stories, :number_of_photos, :number_of_videos, :number_of_lives)
end
end

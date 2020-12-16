class CampaignsController < ApplicationController
  before_action :find_company, only: [:index, :new, :create, :destroy]

  # def index
  #   @campaigns = policy_scope(Campaign)
  # end

  def index

    @campaigns = policy_scope(Campaign).where(company: @company)
    # authorize @campaigns
  end

  def show
    @campaign = Campaign.find(params[:id])
    @company = @campaign.company
    authorize @campaign
    @show_campaign = true
  end

  def new
    # @company = Company.find(params[:company_id])
    @campaign = Campaign.new
    @campaign.company = @company
    authorize @campaign
  end

  def create
    # @company = Company.find(params[:company_id])
    @campaign = Campaign.new(campaign_params)
    @campaign.company = @company
    authorize @campaign
    if @campaign.save
        redirect_to campaign_path(@campaign)
    else
        render :new
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
    authorize @campaign
  end

  def update
    # @company = Company.find(params[:company_id])
    @campaign = Campaign.find(params[:id])
    authorize @campaign
    @campaign.update(campaign_params)
    redirect_to campaign_path(@campaign)
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    authorize @campaign
    @campaign.destroy
    redirect_to company_campaigns_path(@company)
  end

  private

  def find_company
    @company = Company.find(params[:company_id])
  end

  def campaign_params
    params.require(:campaign).permit(:name, :description, :target, :occurs_at, :status, :number_of_stories, :number_of_photos, :number_of_videos, :number_of_lives, :lifestyle, :sport, :food, :gaming, :healthy, :travel, :music, :fashion, :art, :technology, :humour, :beauty, :photo)
  end
end

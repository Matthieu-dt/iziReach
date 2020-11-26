class CampaignsController < ApplicationController
  before_action :find_company, only: [:new, :create, :update, :update]

  # def index
  #   @campaigns = policy_scope(Campaign)
  # end

  def index
    @campaigns = policy_scope(Campaign).where(company: Company.find(params[:id]))
    # authorize @campaigns
  end

  def show
    @campaign = Campaign.find(params[:id])
    authorize @campaign
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
    # @company = Company.find(params[:company_id])
    @campaign = Campaign.find(params[:id])
    authorize @compaign
    @campaign.update(campaign_params)
    redirect_to campaign_path(@campaign)
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    authorize @campaign
    @campaign.destroy
    redirect_to campaigns_path
  end

  private

  def find_company
    @company = Company.find(params[:company_id])
  end

  def campaign_params
    params.require(:campaign).permit(:name, :description, :target, :occurs_at, :status, :number_of_stories, :number_of_photos, :number_of_videos, :number_of_lives, :photo)
  end
end

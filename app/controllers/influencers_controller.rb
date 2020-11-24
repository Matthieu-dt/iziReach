class InfluencersController < ApplicationController

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @influencers = policy_scope(Influencer)
  end

  def new
    @influencer = Influencer.new
    authorize @influencer
  end

  def create
    @influencer = Influencer.new(influencer_params)
    authorize @influencer
    @influencer.user = current_user
    if @influencer.save
      redirect_to influencer_path(@influencer)
    else
      render :new
    end
  end

  def show
    @influencer = Influencer.find(params[:id])
    authorize @influencer
  end

  def edit
    @influencer = Influencer.find(params[:id])
    authorize @influencer
  end

  def update
    @influencer = Influencer.find(params[:id])
    authorize @influencer
    @influencer.update(influencer_params)
    redirect_to influencer_path(@influencer)
  end

  private

  def influencer_params
    params.require(:influencer).permit(:user, :first_name, :last_name, :user_name, :price_per_story, :price_per_photo, :price_per_video, :price_per_live)
  end
end

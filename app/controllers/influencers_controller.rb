require 'open-uri'
require 'json'

class InfluencersController < ApplicationController
  include CallApi

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @influencers = policy_scope(Influencer)
    if params[:query]
      @influencers = policy_scope(Influencer.search_by_influencer(params[:query]))
    else 
      @influencers = policy_scope(Influencer)
    end
    sort_by_matching(@influencers)
    call_api_index
  end

  def sort_by_matching(influencers)
    @campaign = Campaign.find(params[:campaign_id])
    hash = {}
    arr = [:lifestyle, :sport, :food, :gaming, :healthy, :travel, :music, :fashion, :art, :technology, :humour, :beauty]
    influencers.each do |influencer|
      hash[influencer.id] = 0 
      arr.each do |arg|
        if influencer.send(arg) == @campaign.send(arg) && !influencer.send(arg).nil? && !@campaign.send(arg).nil?
          hash[influencer.id] += 1
        end
      end
    end
    sorted_array = hash.sort_by {|key, value| value}.reverse
    @sorted_influencers = []
    sorted_array.each do |element| 
      @sorted_influencers << Influencer.find(element[0])
    end
  #   hash = { "20" => 1,
  # "21" => 2}
    # a la fin il faut un hash avec id_influencer => score
    
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
    url = "https://webstagram.org/api?api_key=0&username=#{@influencer.user_name}&source=instagram"
    data_serialized = open(url).read
    data = JSON.parse(data_serialized)
    @following = data["following"]
    @uploads = data["uploads"]
    @verified = data["is_verified"]
    @av_comments = data["details"]["average_comments"]
    @av_likes = data["details"]["average_likes"]
    @top_posts = data["details"]["top_posts"].values
    @last_9_pics = []
    data["media"].each do |post|
      @last_9_pics << { url: post["media_image_url"], likes: post["likes"], comments: post["comments"] }
    end
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
    params.require(:influencer).permit(:user, :first_name, :last_name, :user_name, :description, :price_per_story, :price_per_photo, :price_per_video, :price_per_live, :fullname, :followers, :engagement, :instagram_pp, :lifestyle, :sport, :food, :gaming, :healthy, :travel, :music, :fashion, :art, :technology, :humour, :beauty, photos: [])
  end
end

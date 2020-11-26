module CallApi
  def call_api_index
      @influencers.each do |influencer|
      url = "https://webstagram.org/api?api_key=0&username=#{influencer.user_name}&source=instagram"
      data_serialized = open(url).read
      data = JSON.parse(data_serialized)
      influencer.fullname = data["full_name"]
      influencer.followers = data["followers"]
      influencer.engagement = data["average_engagement_rate"]
      influencer.instagram_pp = data["profile_picture_url"]
      influencer.save
    end
  end

  def call_api_show

  end
end

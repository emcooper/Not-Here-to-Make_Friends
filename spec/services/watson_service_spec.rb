describe WatsonService do
  it "personality_profile returns the personality profile based on tweets" do
    VCR.use_cassette("services/watson/personality_profile") do
      contestant = create(:contestant, twitter_handle: "@TheAbDoctor")
      tweets = TwitterService.new(contestant).tweets
      @watson_service = WatsonService.new(tweets)
      profile = @watson_service.personality_profile

      byebug
    end
  end
end

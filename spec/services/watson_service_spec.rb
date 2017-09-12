describe WatsonService do
  it "personality_profile returns the personality profile based on tweets" do
    VCR.use_cassette("services/watson/personality_profile") do
      contestant = create(:contestant, twitter_handle: "@TheAbDoctor")
      tweets = TwitterService.new(contestant).tweets
      @watson_service = WatsonService.new(tweets)
      profile = @watson_service.personality_profile[:personality]

      expect(profile).to be_a(Array)
      expect(profile.count).to eq(5)
      expect(profile.first[:name]).to be_a(String)
      expect(profile.first[:percentile]).to be_a(Float)
      expect(profile.first[:children].first[:name]).to be_a(String)
      expect(profile.first[:children].first[:percentile]).to be_a(Float)
    end
  end
end

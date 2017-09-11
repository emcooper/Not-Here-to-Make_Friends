describe TwitterService do
  before :each do
    contestant = create(:contestant, twitter_handle: "@TheAbDoctor")
    @twitter_service = TwitterService.new(contestant)
  end

  it "tweets returns the contestant's recent tweets" do
    VCR.use_cassette("services/twitter/tweets") do
      tweets = @twitter_service.tweets

      expect(tweets).to be_a(Array)
      expect(tweets.first).to be_a(String)
      expect(tweets.last).to be_a(String)
    end
  end
end

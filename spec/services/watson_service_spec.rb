describe WatsonService do
  before :each do
    contestant = create(:contestant)
    @twitter_service = WatsonService.new(contestant)
  end

  it "num_followers returns the number of followers" do
    VCR.use_cassette("services/num_followers") do
  end
end

require 'rails_helper'

RSpec.describe Personality, type: :model do
  describe "class methods" do
    it "generate_from_watson returns personality instance with attributes" do
      VCR.use_cassette("model/personality/generate_from_watson") do
        contestant = create(:contestant, twitter_handle: "@TheAbDoctor")
        tweets = TwitterService.new(contestant).tweets
        personality = Personality.generate_from_watson(tweets)

        expect(personality).to be_a(personality)
        expect(personality.adventurousness).to be_a(float)
        expect(personality.melancholy).to be_a(float)
      end
    end
  end
end

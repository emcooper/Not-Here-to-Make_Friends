class TwitterService
  def initialize(contestant)
    @contestant = contestant
    @conn = Faraday.new(url: "https://api.twitter.com/1.1/statuses/user_timeline.json") do |faraday|
      faraday.headers["screen_name"] = @contestant.twitter_handle
      faraday.adapter Faraday.default_adapter
    end
  end

  def tweets
    twitter.user_timeline("gem")
  end
end

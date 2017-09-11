class TwitterService
  def initialize(contestant)
    @contestant = contestant
  end

  def tweets
    response = $twitter.user_timeline(@contestant.twitter_handle)
    response.map(&:attrs).map {|tweet| tweet[:text]}
  end
end

class ContestantShowPresenter
  attr_reader :contestant

  def initialize(id)
    @contestant = Contestant.find(id)
  end

  def tweets
    TwitterService.new(@contestant).tweets
  end

  def personality
    Personality.generate_from_watson(tweets)
  end
end

class ContestantShowPresenter
  attr_reader :contestant

  def initialize(company_id)
    @contestant = Contestant.find(company_id)
  end

  def tweets
    TwitterService.new(@contestant).tweets
  end

  def watson_data
    WatsonService.new(tweets)
  end
end

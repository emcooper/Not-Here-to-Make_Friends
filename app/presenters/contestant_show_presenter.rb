class ContestantShowPresenter
  attr_reader :contestant

  def initialize(company_id)
    @contestant = Contestant.find(company_id)
  end
end

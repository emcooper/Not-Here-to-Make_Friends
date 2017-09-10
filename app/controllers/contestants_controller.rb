class ContestantsController < ApplicationController
  def show
    @contestant_presenter = ContestantShowPresenter.new(params[:id])
  end
end

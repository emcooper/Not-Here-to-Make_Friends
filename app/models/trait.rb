class Trait
  attr_reader :title, :score

  def initialize(params)
    @title = params[:title]
    @score = params[:score]
  end


  def self.generate_traits(params)
    params.map {|k,v| Trait.new({title: k, score: v})}
  end
end

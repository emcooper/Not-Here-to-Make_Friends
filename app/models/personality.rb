class Personality
  attr_reader :traits

  def initialize(params)
    @traits = create_traits(params)
  end

  def self.generate_from_watson(text)
    raw_data = WatsonService.new(text).parse_traits
    Personality.new(raw_data)
  end

  def create_traits(params)
      params["Anger"] = params["Fiery"]
      params["Anxiety"] = params["Prone to worry"]
      params["Morality"] = params["Uncompromising"]
      params.select! {|k, v| Personality.selected_traits.include?(k)}
      Trait.generate_traits(params)
  end

  def self.selected_traits
    ["Adventurousness", "Imagination", "Intellect", "Authority-challenging",
      "Self-discipline", "Assertiveness", "Cheerfulness", "Outgoing", "Modesty",
      "Morality", "Anger", "Anxiety"]
  end
end

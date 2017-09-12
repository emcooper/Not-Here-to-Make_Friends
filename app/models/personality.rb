class Personality
  attr_reader :adventurousness,
              :artistic,
              :emotionality,
              :imagination,
              :authority_challenging,
              :cautiousness,
              :self_discipline,
              :activity_level,
              :assertiveness,
              :cheerfulness,
              :excitement_seeking,
              :friendliness,
              :altruism,
              :modesty,
              :morality,
              :anger,
              :anxiety,
              :melancholy

  def initialize(data)
    @adventurousness = data["Adventurousness"]
    @artistic = data["Artistic interests"]
    @emotionality = data["Emotionality"]
    @imagination = data["Imagination"]
    @authority_challenging = data["Authority-challenging"]
    @cautiousness = data["Achievement striving"]
    @self_discipline = data["Self-discipline"]
    @activity_level = data["Activity level"]
    @assertiveness = data["Assertiveness"]
    @cheerfulness = data["Cheerfulness"]
    @excitement_seeking = data["Excitement-seeking"]
    @friendliness = data["Outgoing"]
    @altruism = data["Altruism"]
    @modesty = data["Modesty"]
    @morality = data["Morality"]
    @anger = data["Anger"]
    @anxiety = data["Anxiety"]
    @melancholy = data["Melancholy"]
  end

  def self.generate_from_watson(text)
    raw_data = WatsonService.new(text).parse_traits
    Personality.new(raw_data)
  end
end

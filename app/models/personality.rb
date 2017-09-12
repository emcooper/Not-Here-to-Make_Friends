class Personality
  def initialize(data)
    @adventurousness = data[:adventurousness]
    @artistic = data[:artistic]
    @emotionality = data[:emotionality]
    @imagination = data[:imagination]
    @authority_challenging = data[:authority_challenging]
    @cautiousness = data[:cautiousness]
    @self_discipline = data[:self_discipline]
    @activity_level = data[:activity_level]
    @assertiveness = data[:assertiveness]
    @cheerfulness = data[:cheerfulness]
    @excitement_seeking = data[:excitement_seeking]
    @friendliness = data[:friendliness]
    @altruism = data[:altruism]
    @modesty = data[:modesty]
    @morality = data[:morality]
    @anger = data[:anger]
    @anxiety = data[:anxiety]
    @melancholy = data[:melancholy]
  end

  def self.generate_from_watson(text)
    raw_data = WatsonService.new(text).parse_traits
    Personality.new(raw_data)
  end
end

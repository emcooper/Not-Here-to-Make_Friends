class Personality
  attr_reader :adventurousness,
              :melancholy


  def initialize(data)
    @adventurousness = data[:Adventurousness]
    @artistic = data[:Artistic]
    @emotionality = data[:Emotionality]
    @imagination = data[:Imagination]
    @authority_challenging = data[:Authority_challenging]
    @cautiousness = data[:Cautiousness]
    @self_discipline = data[:Self_discipline]
    @activity_level = data[:Activity_level]
    @assertiveness = data[:Assertiveness]
    @cheerfulness = data[:Cheerfulness]
    @excitement_seeking = data[:Excitement_seeking]
    @friendliness = data[:Friendliness]
    @altruism = data[:Altruism]
    @modesty = data[:Modesty]
    @morality = data[:Morality]
    @anger = data[:Anger]
    @anxiety = data[:Anxiety]
    @melancholy = data[:Melancholy]
  end

  def self.generate_from_watson(text)
    raw_data = WatsonService.new(text).parse_traits.symbolize_keys
    Personality.new(raw_data)
  end
end

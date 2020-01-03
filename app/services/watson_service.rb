class WatsonService
  def initialize(text, contestant)
    @text = text
    @contestant = contestant
    @conn = Faraday.new(url: "#{ENV["watson_url"]}/v3/profile?version=2017-10-13") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.headers["data-binary"] = "text/plain;charset=utf-8"
    end
    @conn.basic_auth("apikey", "#{ENV["watson_api_key"]}")
  end

  def personality_profile
    response = @conn.post do |req|
      req.headers['Content-Type'] = 'text/plain;charset=utf-8'
      req.headers['Accept'] = 'application/json'
      req.body = @text
    end
    JSON.parse(response.body, symbolize_names: :true)
  end

  def parse_traits
    traits = {}
    personality_profile[:personality].each do |big5_trait|
      big5_trait[:children].each do |child_trait|
        traits[child_trait[:name]] = child_trait[:percentile]
      end
    end
    return select_desired_traits(traits)
  end

  def save_qualities
    watson_analysis = parse_traits
    Quality.all.each do |quality|
      ContestantQuality.create(percentage: watson_analysis[quality.name] * 100,
                               quality: quality,
                               contestant: @contestant)
    end
  end

  def select_desired_traits(watson_traits)
      watson_traits["Anger"] = watson_traits["Fiery"]
      watson_traits["Anxiety"] = watson_traits["Prone to worry"]
      watson_traits["Morality"] = watson_traits["Uncompromising"]
      watson_traits.select! {|k, v| desired_traits.include?(k)}
  end

  def desired_traits
    Quality.pluck(:name)
  end
end

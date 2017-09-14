class WatsonService
  def initialize(text)
    @text = text.join
    @conn = Faraday.new(url: "https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2016-10-20") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.headers["data-binary"] = "text/plain;charset=utf-8"
    end
    @conn.basic_auth("#{ENV["watson_username"]}", "#{ENV["watson_password"]}")
  end

  def personality_profile
    response = @conn.post do |req|
      req.headers['Content-Type'] = 'text/plain;charset=utf-8'
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
    return traits
  end
end

class TwitterService
  def initialize(contestant)
    @contestant = contestant
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Accept"] = "application/vnd.github.cloak-preview"
      faraday.adapter Faraday.default_adapter
    end
  end


end

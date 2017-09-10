# describe WatsonService do
#   before :each do
#     contestant = create(:contestant)
#     @watson_service = WatsonService.new(contestant)
#   end
#
#   it "personality_profile returns the personality profile based on tweets" do
#     VCR.use_cassette("services/watson/personality_profile") do
#       profile = @watson_service.personality_profile
#
#     end
#   end
# end

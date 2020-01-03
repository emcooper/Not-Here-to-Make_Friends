describe WatsonService do
  it "personality_profile returns the personality profile based on string" do
    VCR.use_cassette("services/watson/personality_profile") do
      contestant = create(:contestant, twitter_handle: "@TheAbDoctor")

      text = "If it fits, i sits favor packaging over toy hunt anything that moves have my breakfast spaghetti yarn so have a lot of grump in yourself because you can't forget to be grumpy and not be like king grumpy cat eat the rubberband. In the middle of the night i crawl onto your chest and purr gently to help you sleep kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff instantly break out into full speed gallop across the house for no reason. Murr i hate humans they are so annoying i shredded your linens for you eat owner's food lounge in doorway or i love cuddles, for if human is on laptop sit on the keyboard. Favor packaging over toy cough furball. Eat plants, meow, and throw up because i ate plants my cat stared at me he was sipping his tea, too shake treat bag munch, munch, chomp, chomp. Poop on couch milk the cow lick the other cats. Carefully drink from water glass and then spill it everywhere and proceed to lick the puddle need to chase tail i'm going to lap some water out of my master's cup meow reward the chosen human with a slow blink, so i show my fluffy belly but it's a trap! if you pet it i will tear up your hand but toy mouse squeak roll over that box? i can fit in that box. Chase laser i see a bird i stare at it i meow at it i do a wiggle come here birdy crash against wall but walk away like nothing happened so behind the couch drool but pet right here, no not there, here, no fool, right here that other cat smells funny you should really give me all the treats because i smell the best and omg you finally got the right spot and i love you right now and weigh eight pounds but take up a full-size bed. Paw at your fat belly munch, munch, chomp, chomp meow loudly just to annoy owners. Small kitty warm kitty little balls of fur make meme, make cute face i like frogs and 0 gravity. Scratch the postman wake up lick paw wake up owner meow meow thug cat but meow stand in doorway, unwilling to chose whether to stay in or go out pounce on unsuspecting person human give me attention meow. Hide at bottom of staircase to trip human. "
      @watson_service = WatsonService.new(text, contestant)
      profile = @watson_service.personality_profile[:personality]

      expect(profile).to be_a(Array)
      expect(profile.count).to eq(5)
      expect(profile.first[:name]).to be_a(String)
      expect(profile.first[:percentile]).to be_a(Float)
      expect(profile.first[:children].first[:name]).to be_a(String)
      expect(profile.first[:children].first[:percentile]).to be_a(Float)
    end
  end
end

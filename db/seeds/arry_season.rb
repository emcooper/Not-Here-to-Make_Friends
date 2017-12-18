season_data = {first_name: "Arie", last_name: "Luyendyk Jr.", season_number: 22,
                season_type: "bachelor", status: "active", headshot: "https://cdn1.edgedatg.com/aws/v2/abc/TheBachelor/person/2101860/b9fe60764dafd3c118a3c2e7f2ed9f23/512x288-Q90_b9fe60764dafd3c118a3c2e7f2ed9f23.jpg",
                draft_date: "2017-12-30", drafted: false}

contestant_1 = {name: "Ali", headshot: "http://datg-cms-source-repo.s3-website-us-east-1.a...", bio: nil, season_id: 1,
                age: 27, hometown: "Lawton, OK", occupation: "Personal Stylist", twitter_handle: "@Ali_Marie_"}

contestant_2 = {name: "Amber", headshot: "http://datg-cms-source-repo.s3-website-us-east-1.a...", bio: nil, season_id: 1,
                age: 29, hometown: "Denver, CO", occupation: "Business Owner", twitter_handle: "@AmberWilk"}

season = Season.create!(season_data)
season.contestants.create!(contestant_1)
season.contestants.create!(contestant_2)

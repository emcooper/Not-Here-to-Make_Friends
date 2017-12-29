# to run: rake db:seed:arry_season

Season.destroy_all


season_data = {first_name: "Arie", last_name: "Luyendyk Jr.", season_number: 22,
                season_type: "bachelor", status: "active", headshot: "https://cdn1.edgedatg.com/aws/v2/abc/TheBachelor/person/2101860/b9fe60764dafd3c118a3c2e7f2ed9f23/512x288-Q90_b9fe60764dafd3c118a3c2e7f2ed9f23.jpg",
                draft_date: "2017-12-30", drafted: false}

contestant_1 = {name: "Ali", headshot: "http://datg-cms-source-repo.s3-website-us-east-1.amazonaws.com/ABC/TheBachelor/BAC_S22_cast-ali/a30f079d-e650-4b79-a409-e3ad47220dc2.jpg", bio: nil, season_id: 1,
                age: 27, hometown: "Lawton, OK", occupation: "Personal Stylist", twitter_handle: "@Ali_Marie_"}

contestant_2 = {name: "Amber", headshot: "http://datg-cms-source-repo.s3-website-us-east-1.amazonaws.com/ABC/TheBachelor/BAC_S22_cast-amber/9d94dbbe-3bd7-432d-852d-1b6b8fc58bf8.jpg", bio: nil, season_id: 1,
                age: 29, hometown: "Denver, CO", occupation: "Business Owner", twitter_handle: "@AmberWilk"}

contestant_3 = {name: "Annaliese", headshot: "http://datg-cms-source-repo.s3-website-us-east-1.amazonaws.com/ABC/TheBachelor/BAC_S22_cast-annaliese/97100744-6afa-41c7-8faa-a418410de35f.jpg", bio: nil, season_id: 1,
                age: 32, hometown: "San Mateo, CA", occupation: "Event Designer", twitter_handle: ""}

season = Season.create!(season_data)
season.contestants.create!(contestant_1)
season.contestants.create!(contestant_2)
season.contestants.create!(contestant_3)

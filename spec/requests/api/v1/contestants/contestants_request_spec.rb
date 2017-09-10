describe 'technologies api' do
  it "sends the most 10 most popular technologies with count of frontend and backend users" do
    user = create(:user)
    season = create(:season, :with_contestants_and_points)
    contestant = Contestant.second

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    get "/api/v1/contestants/#{contestant.id}/weekly_points"

    expect(response).to be_success
    response = JSON.parse(response.body)
    expect(techs.count).to eq(2)
    expect(response.first["week"]).to eq(1)
    expect(response.last["week"]).to eq(1)
    expect(response.first["points"]).to eq(2)
    expect(response.last["points"]).to eq(2)
  end
end

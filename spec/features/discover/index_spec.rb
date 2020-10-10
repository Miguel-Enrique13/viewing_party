require 'rails_helper'

RSpec.describe "When I visit the dashboard" do
  it "Then I can click the discover button and I'm taken to the discover page" do
    user = create(:user)
    visit new_login_path
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on 'login'
    visit users_path

    click_on 'Discover Movies!'

    expect(current_path).to eq(discover_index_path)


  end
end

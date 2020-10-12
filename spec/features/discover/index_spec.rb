require 'rails_helper'

RSpec.describe "As an authenticated User " do
  describe "the discover page" do
    before :each do
      user = create(:user)
      visit new_login_path
      fill_in :username, with: user.username
      fill_in :password, with: user.password
      click_on 'login'
      visit discover_index_path
    end

    it "should have a button for top 40 movies" do

      expect(page).to have_button('Discover Top 40 Movies')

      click_on('Discover Top 40 Movies')

      expect(current_path).to eq(movies_path)
    end

    it "should have a search bar for movies" do
      expect(page).to have_button('Search')
      fill_in :query, with: "My Movie"
      click_button('Search')

      expect(current_path).to eq(movies_path)
    end
  end
end

describe "As an unauthenitcated user" do
  it "I should get an error message" do
    visit discover_index_path

    expect(page).to have_content("The page you were looking for doesn't exist (404)")

  end
end

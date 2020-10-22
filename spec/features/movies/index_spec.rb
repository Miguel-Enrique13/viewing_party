require 'rails_helper'

RSpec.describe "As an authenticated user" do
  describe "The movies index page" do
    before :each do
      @user = create(:user)

      visit new_login_path
      fill_in :username, with: @user.username
      fill_in :password, with: @user.password
      click_on 'login'
    end

    it "should have button to discover top 40 movies" do
      VCR.use_cassette("top_40_rated_movies", allow_playback_repeats: true) do
        visit users_path

        click_on 'Top Rated Movies!'
        expect(current_path).to eq(movies_path)
      end
    end

    it "should have a search bar for movies" do
      VCR.use_cassette("top_40_rated_movies", allow_playback_repeats: true) do
        visit movies_path

        VCR.use_cassette('lighthouse_search_results', allow_playback_repeats: true) do
          fill_in :query, with: 'lighthouse'
          click_on 'Search'
          expect(current_path).to eq(movies_path)

          page.all('.movie-row').each do |movie|
            expect(movie).to have_content(/Lighthouse/i)
          end
        end
      end
    end

    it "shows top 40 movies when I click the button" do
      VCR.use_cassette("top_40_rated_movies", allow_playback_repeats: true) do
        visit users_path
        click_on 'Top Rated Movies!'

        expect(page).to have_css('#top-rated')
        expect(page).to have_css('#movie-rows', count: 40)

        within(first('#movie-rows')) do
          expect(page).to have_link("Gabriel's Inferno Part II")
          expect(page).to have_content(8.9)
        end
      end
    end
  end
end

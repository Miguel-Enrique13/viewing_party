require 'rails_helper'

describe "As an authenticated user" do
  before :each do
    @user = create(:user)

    visit new_login_path
    fill_in :username, with: @user.username
    fill_in :password, with: @user.password
    click_on 'login'
  end

  describe "I visit the movies details page" do
    it "I can see a create viewing party button" do
      VCR.use_cassette("The_Prestige_results", allow_playback_repeats: true) do
        visit movies_path
        fill_in :query, with: "The Prestige"
        click_on 'Search'
        click_on 'The Prestige'

        expect(current_path).to eq(movie_path(1124))
        expect(page).to have_button('Create Viewing Party')
      end
    end

    it "I can see movie title, vote average, runtime in hours and minutes, genres, summary description, first 10 cast members, total reviews, all reviews " do
      VCR.use_cassette("The_Prestige_results", allow_playback_repeats: true) do
        visit movies_path
        fill_in :query, with: "The Prestige"
        click_on 'Search'
        click_on 'The Prestige'

        expect(page).to have_content('The Prestige')
        expect(page).to have_content("Vote Average: 8.2")
        expect(page).to have_content("Runtime: 2 hr 10 min")
        expect(page).to have_content('Genres: Drama, Mystery, Thriller')
        expect(page).to have_content('A mysterious story of two magicians whose intense rivalry leads them on a life-long battle for supremacy -- full of obsession, deceit and jealousy with dangerous and deadly consequences.')

        expect(find('#actors').all("li").size).to be_between(0,10).inclusive

        within('#actors') do
          expect(page).to have_content('Christian Bale as Alfred Borden')
        end

        expect(page).to have_content('Total Reviews: 1')

        within('#review-5a5b08c5c3a36867e401affe') do
          expect(page).to have_content('Author: izgzhen')
          expect(page).to have_content("Perplexed by the storyline at the beginning, deeply attracted to the narratives of the intense rivalry between two actors")
        end
      end
    end
  end
end

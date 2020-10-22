require "rails_helper"

describe "As an authenticated user" do
  describe "When I vist dashboard" do
    before :each do
      @user1 = create(:user, username: "Billy")
      @user2 = create(:user, username: "Cabron")
      @user3 = create(:user, username: "Joe")
      visit new_login_path
      fill_in :username, with: @user1.username
      fill_in :password, with: @user1.password
      click_on 'login'

      fill_in :email, with: @user2.email
      click_on 'Add Friends'
      fill_in :email, with: @user3.email
      click_on 'Add Friends'
    end

    it "I click on create viewing party button, I am taken to new viewing party form" do
      VCR.use_cassette("The_Prestige_results", allow_playback_repeats: true) do
        visit movie_path(1124)

        expect(page).to have_button("Create Viewing Party")
        click_on "Create Viewing Party"

        expect(current_path).to eq(new_party_path)
        expect(page).to have_content("Duration:")
        expect(page).to have_content("Date & Time:")
        expect(page).to have_content("Invite Friends:")
        expect(page).to have_content(@user2.username)
        expect(page).to have_content(@user3.username)
        expect(page).to have_button("Create Viewing Party")
      end


    end

    it "I click on create viewing party button, I fill in the form" do
      VCR.use_cassette("The_Prestige_results", allow_playback_repeats: true) do
        visit movie_path(1124)
        click_on "Create Viewing Party"

        within('#date_post_1i') do
          find("option[value='2020']").select_option
        end

        within('#date_post_2i') do
          find("option[value='11']").select_option
        end

        within('#date_post_3i') do
          find("option[value='21']").select_option
        end

        within('#date_post_4i') do
          find("option[value='16']").select_option
        end

        within('#date_post_5i') do
          find("option[value='15']").select_option
        end

        fill_in :duration, with: 145

        within("#friend-#{@user2.id}") do
          check("friends[]")
        end

        click_on "Create Viewing Party"

        expect(current_path).to eq(users_path)

        within('#host') do
          expect(page).to have_content('Movie')
          expect(page).to have_content('Date')
          expect(page).to have_content('Time')
          expect(page).to have_content('The Prestige')
          expect(page).to have_content('21 November 2020')
          expect(page).to have_content('04:15 PM')
        end
      end
    end

    it "I fill in duration shorter than movie length, should get a flash message giving me an error" do
      VCR.use_cassette("The_Prestige_results", allow_playback_repeats: true) do
        visit movie_path(1124)
        click_on "Create Viewing Party"

        within('#date_post_1i') do
          find("option[value='2020']").select_option
        end

        within('#date_post_2i') do
          find("option[value='11']").select_option
        end

        within('#date_post_3i') do
          find("option[value='21']").select_option
        end

        within('#date_post_4i') do
          find("option[value='16']").select_option
        end

        within('#date_post_5i') do
          find("option[value='15']").select_option
        end

        fill_in :duration, with: 100

        click_on 'Create Viewing Party'

        expect(current_path).to eq(movie_path(1124))
        expect(page).to have_content("Duration must be greater than or equal to 130")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe "User Dashboard", type: :feature do
  it "Can only be accessed by signed in users" do
    user = create(:user)

    visit users_path
    expect(page).to have_content("The page you were looking for doesn't exist (404)")

    visit new_login_path
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on 'login'

    expect(current_path).to eq(users_path)
    expect(page).not_to have_content("The page you were looking for doesn't exist (404)")
  end

  it "Once logged in, on the dashboard I see discover movies button, friends section, viewing party section" do
    user = create(:user)
    visit new_login_path
    fill_in :username, with: user.username
    fill_in :password, with: user.password
    click_on 'login'

    visit users_path

    expect(page).to have_button('Discover Movies!')
    expect(page).to have_css("#friends")
    expect(page).to have_css("#party")
  end

  describe "Should have a friends section" do
    before :each do
      @user = create(:user)

      visit new_login_path
      fill_in :username, with: @user.username
      fill_in :password, with: @user.password
      click_on 'login'
    end

    it "that is empty if you have no friends" do
      within("#friend-list") do
        expect(page).to have_content('You currently have no friends')
      end
    end

    it "can only add friends if they have a valid email" do
      @user2 = create(:user)

      within('#friends-search') do
        fill_in :email, with: @user2.email
        click_on 'Add Friends'
      end

      within('#friend-list') do
        expect(page).to have_content(@user2.username)
      end
    end

    it "I can't add friends without an authenticated email" do
      fake_user = 'nobody@email.com'

      within('#friends-search') do
        fill_in :email, with: fake_user
        click_on 'Add Friends'
      end

      expect(page).to have_content("User does not exist")
    end
  end
end

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

    visit users_path

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
    expect(page).to have_css(".Friends")
    expect(page).to have_css(".Party")
  end
end

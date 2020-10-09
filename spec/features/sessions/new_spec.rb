require 'rails_helper'

RSpec.describe "User Login/Logout", type: :feature do
  before :each do
    @user = create(:user)
  end

  it "When I click log in I can input my credentials and I'm taken to my profile page" do
    visit root_path

    click_on 'login'

    expect(current_path).to eq(new_login_path)
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")

    fill_in :username, with: @user.username
    fill_in :password, with: @user.password

    click_on 'login'

    expect(current_path).to eq(users_path)
    expect(page).to have_content('You have successfully logged in!')
  end

  it "When I try to login with the wrong password or email I get an error" do
    visit new_login_path

    fill_in :username, with: @user.username
    fill_in :password, with: "YOLO"

    click_on 'login'

    expect(current_path).to eq(new_login_path)
    expect(page).to have_content('Incorrect Email or Password')
  end
end

require 'rails_helper'

describe "When I first visit the app" do
  it "then I see a welcome message, description, login button, and register button" do
    visit root_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome to Viewing Party!")
    expect(page).to have_content("The app that lets you set up movie dates with your friends!")
    expect(page).to have_button("login")
    expect(page).to have_button("register")
  end
end

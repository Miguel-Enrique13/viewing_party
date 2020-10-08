require 'rails_helper'

RSpec.describe 'User Registration', type: :feature do
  it "When I click on register, I can fill out the form and a user is create" do

    first_name = 'Joe'
    last_name = 'Bidden'
    username = 'JBidden'
    email = 'jbidden@gmail.com'
    password = 'password123'

    visit root_path

    click_on 'register'

    expect(current_path).to eq(new_user_path)

    expect(page).to have_content('First Name')
    expect(page).to have_content('Last Name')
    expect(page).to have_content('Email')
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
    expect(page).to have_content('Password Confirmation')
    expect(page).to have_button('register user')

    fill_in :first_name, with: first_name
    fill_in :last_name, with: last_name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password

    click_on 'register user'

    expect(current_path).to eq(users_path)
    expect(page).to have_content('You have been registered and are now logged in!')
  end

  it "When I enter an email alrady taken I can not register" do
    user1 = create(:user)

    visit root_path

    click_on 'register'

    expect(current_path).to eq(new_user_path)

    fill_in :first_name, with: user1.first_name
    fill_in :last_name, with: user1.last_name
    fill_in :username, with: 'BLAH_BLAH'
    fill_in :email, with: user1.email
    fill_in :password, with: user1.password
    fill_in :password_confirmation, with: user1.password

    click_on 'register user'

    expect(current_path).to eq(new_user_path)

    expect(page).to have_content('Email has already been taken')
  end

  it "When I enter a username alrady taken I can not register" do
    user1 = create(:user)

    visit root_path

    click_on 'register'

    expect(current_path).to eq(new_user_path)

    fill_in :first_name, with: user1.first_name
    fill_in :last_name, with: user1.last_name
    fill_in :username, with: user1.username
    fill_in :email, with: 'Blah@gmail.com'
    fill_in :password, with: user1.password
    fill_in :password_confirmation, with: user1.password

    click_on 'register user'

    expect(current_path).to eq(new_user_path)

    expect(page).to have_content('Username has already been taken')
  end

  it "When I enter a username alrady taken I can not register" do
    user1 = create(:user)

    visit root_path

    click_on 'register'

    expect(current_path).to eq(new_user_path)

    fill_in :first_name, with: user1.first_name
    fill_in :last_name, with: user1.last_name
    fill_in :username, with: user1.username
    fill_in :email, with: user1.email
    fill_in :password, with: user1.password
    fill_in :password_confirmation, with: user1.password

    click_on 'register user'

    expect(current_path).to eq(new_user_path)

    expect(page).to have_content('Username has already been taken and Email has already been taken')
  end
end

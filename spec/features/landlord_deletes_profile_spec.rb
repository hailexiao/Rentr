require 'rails_helper'

feature 'delete landlord account', %{
  As a no longer interested landlord
  I want to delete my account
  So that I am no longer associated with the app
} do

  scenario 'landlord logs in and deletes account' do

    landlord = FactoryGirl.create(:landlord)

    sign_in_as_landlord(landlord)

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')

    visit edit_landlord_registration_path
    click_button 'Cancel my account'


    expect(page).to have_content
    'Bye! Your account has been successfully cancelled.'
  end
end

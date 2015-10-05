require 'rails_helper'

feature 'landlord signs out', %Q{
  As an authenticated landlord
  I want to sign out
  So that my identity is forgotten about on the machine I'm using
} do

  # Acceptance Criteria
  # [*] If I'm signed in, I have an option to sign out
  # [*] When I opt to sign out, I get a confirmation that my identity has been
  #   forgotten on the machine I'm using

  scenario 'authenticated landlord signs out' do
    landlord = FactoryGirl.create(:landlord)

    sign_in_as_landlord(landlord)

    expect(page).to have_content('Signed in successfully')

    click_link 'Sign Out'
    expect(page).to have_content('Signed out successfully')
  end

end

require 'rails_helper'

feature 'tenant signs out', %Q{
  As an authenticated tenant
  I want to sign out
  So that my identity is forgotten about on the machine I'm using
} do

  # Acceptance Criteria
  # [*] If I'm signed in, I have an option to sign out
  # [*] When I opt to sign out, I get a confirmation that my identity has been
  #   forgotten on the machine I'm using

  scenario 'authenticated tenant signs out' do
    tenant = FactoryGirl.create(:tenant)

    sign_in_as_tenant(tenant)

    expect(page).to have_content('Signed in successfully')

    click_link 'Sign Out'
    expect(page).to have_content('Signed out successfully')
  end

end

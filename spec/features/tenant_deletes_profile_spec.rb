require 'rails_helper'

feature 'delete tenant account', %{
  As a no longer interested tenant
  I want to delete my account
  So that I am no longer associated with the app
} do

  scenario 'tenant logs in and deletes account' do

    tenant = FactoryGirl.create(:tenant)

    sign_in_as_tenant(tenant)

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')

    visit edit_tenant_registration_path
    click_button 'Cancel my account'


    expect(page).to have_content
    'Bye! Your account has been successfully cancelled.'
  end
end

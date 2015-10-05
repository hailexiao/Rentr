require 'rails_helper'

feature 'tenant signs in', %Q{
  As a signed up tenant
  I want to sign in
  So that I can regain access to my account
} do
  scenario 'specify valid credentials' do
    tenant = FactoryGirl.create(:tenant)

    visit new_tenant_session_path


    fill_in 'Email', with: tenant.email
    fill_in 'Password', with: tenant.password

    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')
  end

  scenario 'specify invalid credentials' do
    visit new_tenant_session_path

    click_button 'Sign in'
    
    expect(page).to have_content('Invalid email or password')
    expect(page).to_not have_content('Sign Out')
  end
end

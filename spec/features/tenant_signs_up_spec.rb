require 'rails_helper'

feature 'tenant registers', %(
  As a tenant
  I want to register
  So that I can create an account
) do

  # Acceptance Criteria:
  # [*] Tenant must specify a valid email address,
  #   password, and password confirmation
  # [*] If tenant doesn't specify the required information, they are presented with
  #   an error message

  scenario 'tenant provides valid information' do
    visit new_tenant_registration_path

    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'provide invalid registration information' do
    visit new_tenant_registration_path

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end

end

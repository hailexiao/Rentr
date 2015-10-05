module AuthenticationHelper
  def sign_in_as_tenant(tenant)
    visit new_tenant_session_path

    fill_in 'Email', with: tenant.email
    fill_in 'Password', with: tenant.password
    click_button 'Sign in'
  end

  def sign_in_as_landlord(landlord)
    visit new_landlord_session_path

    fill_in 'Email', with: landlord.email
    fill_in 'Password', with: landlord.password
    click_button 'Sign in'
  end
end

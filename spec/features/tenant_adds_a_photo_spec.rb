require 'rails_helper'

feature 'apartment photos', %(
  As a tenant
  I want to upload photos of my rental units
  So potential future tenants can see what it looks like
) do

  # Acceptance criteria:
  # [] If tenant uploads a valid photo, it should be present on the rental unit
  # => show page.
  # [] If tenant uploads an invalid photo, they are redirected to the new
  # => page with errors.

  before :each do
    @tenant = FactoryGirl.create(:tenant)
    @gas_utility = FactoryGirl.create(:gas_utility)
    @electric_utility = FactoryGirl.create(:electric_utility)
    @neighborhood = FactoryGirl.create(:neighborhood)
  end

  scenario 'photo is valid' do
    sign_in_as_tenant(@tenant)
    visit new_rental_unit_path

    fill_in 'Address', with: '550 Cambridge St, Boston, MA 02134'
    select '1', from: 'Number of bedrooms'
    fill_in 'Type of dwelling', with: 'Subdivided single-family house'
    fill_in 'Monthly rent', with: 2500
    select @gas_utility.name, from: 'Gas utility'
    select @electric_utility.name, from: 'Electric utility'
    select @neighborhood.name, from: 'Neighborhood'
    image_path = Rails.root + 'public/images/cambridge-66714_640.jpg'
    attach_file 'rental_unit_photos', image_path

    click_button 'Create Rental unit'

    expect(page).to have_css('div[class*="apartment-photos"]')
  end

  scenario 'photo is invalid' do
    sign_in_as_tenant(@tenant)
    visit new_rental_unit_path

    fill_in 'Address', with: '550 Cambridge St, Boston, MA 02134'
    select '1', from: 'Number of bedrooms'
    fill_in 'Type of dwelling', with: 'Subdivided single-family house'
    fill_in 'Monthly rent', with: 2500
    select @gas_utility.name, from: 'Gas utility'
    select @electric_utility.name, from: 'Electric utility'
    select @neighborhood.name, from: 'Neighborhood'
    image_path = Rails.root + 'public/robots.txt'
    attach_file 'rental_unit_photos', image_path

    click_button 'Create Rental unit'

    expect(page).to have_content("You are not allowed to upload")
  end

end

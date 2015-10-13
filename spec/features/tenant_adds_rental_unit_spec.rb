require 'rails_helper'

feature 'add a rental unit', %(
  As a tenant
  I want to add my unit
  So that I can compare it with other units
) do

  # Acceptance criteria
  # [*] If I put in a valid address, number of bedrooms, type of dwelling,
  # => monthly rent, electric and gas utility, and neighborhood, I should be
  # => redirected to the show page for the rental unit.
  # [*] If I have missing or invalid information, I should be redirected to the
  # => new page for rental units.
  # [*] If I try to add an already existing unit, I am redirected to the show
  # => page for that unit.

  context 'add a new unit' do
    scenario 'tenant enters valid info' do
      tenant = FactoryGirl.create(:tenant)
      gas_utility = FactoryGirl.create(:gas_utility)
      electric_utility = FactoryGirl.create(:electric_utility)
      neighborhood = FactoryGirl.create(:neighborhood)

      sign_in_as_tenant(tenant)

      visit new_rental_unit_path

      fill_in 'Address',
        with: '33 Harrison Ave Ste 501, Boston, MA 02111'
      select '1', from: 'Number of bedrooms'
      fill_in 'Type of dwelling', with: 'Apartment block'
      fill_in 'Monthly rent', with: 3000
      select electric_utility.name, from: 'Electric utility'
      select gas_utility.name, from: 'Gas utility'
      select neighborhood.name, from: 'Neighborhood'
      click_button 'Create Rental unit'

      expect(page).to have_content('Rental unit added!')
    end

    scenario 'tenant enters invalid info' do
      tenant = FactoryGirl.create(:tenant)
      sign_in_as_tenant(tenant)

      visit new_rental_unit_path
      click_button 'Create Rental unit'

      expect(page).to have_content("can't be blank")
    end
  end

  context 'try to add an existing unit' do
    scenario 'tenant enters address of existing unit' do
      tenant = FactoryGirl.create(:tenant)
      unit = FactoryGirl.create(:rental_unit)
      sign_in_as_tenant(tenant)

      visit new_rental_unit_path
      fill_in 'Address', with: unit.address
      select unit.number_of_bedrooms, from: 'Number of bedrooms'
      fill_in 'Type of dwelling', with: unit.type_of_dwelling
      fill_in 'Monthly rent', with: unit.monthly_rent
      select unit.electric_utility.name, from: 'Electric utility'
      select unit.gas_utility.name, from: 'Gas utility'
      select unit.neighborhood.name, from: 'Neighborhood'
      click_button 'Create Rental unit'

      expect(page).to have_content('Unit already exists! Here it is...')
    end
  end

end

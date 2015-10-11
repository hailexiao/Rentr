require 'rails_helper'

feature 'add a bill for a rental unit', %(
  As a tenant
  I want to add a bill for my rental unit
  So that other tenants can see my unit's utility costs
) do

  # Acceptance criteria
  # [] If I am the tenant of a rental unit and I add a bill for it with valid
  # => month and amount, I am taken to the show page for that unit and see
  # => that bill.
  # [] If I am not the tenant of a rental unit and try to enter a bill for it, I
  # => am shown an error and redirected to the new bill page.
  # [] If I enter invalid month and amount for the bill I am shown an error and
  # => redirected to the new bill page.

  context 'user is the tenant' do
    before :each do
      tenant_1 = FactoryGirl.create(:tenant)
      rental_unit_1 = FactoryGirl.create(:rental_unit, tenant: tenant_1)
    end

    scenario 'tenant enters valid information', js: true do
      sign_in_as_tenant(tenant_1)

      visit rental_unit_bills_path(rental_unit_1)
      page.execute_script("$('#month_picker').val('11/2014')")
      # fill_in 'Month', with: 'November'
      fill_in 'Amount', with: 300
      click_button 'Submit bill'

      expect(page).to have_content('Bill added!')
    end

    scenario 'tenant enters invalid information' do
      sign_in_as_tenant(tenant_1)

      visit rental_unit_bills_path(rental_unit_1)
      click_button 'Submit bill'

      expect(page).to have_content('can\'t be blank!')
    end
  end

  context 'user is not the tenant' do
    before :each do
      tenant_1 = FactoryGirl.create(:tenant)
      tenant_2 = FactoryGirl.create(:tenant)
      rental_unit_1 = FactoryGirl.create(:rental_unit, tenant: tenant_1)
    end

    scenario 'user enters valid information', js: true do
      sign_in_as_tenant(tenant_2)

      visit rental_unit_bills_path(rental_unit_1)
      page.execute_script("$('#month_picker').val('11/2014')")
      # fill_in 'Month', with: 'November'
      fill_in 'Amount', with: 300
      click_button 'Submit bill'

      expect(page).to have_content(
        'Only a tenant of this unit can submit bills!'
                                  )
    end
  end

end

# require 'rails_helper'
#
# feature 'add a rental unit', %(
#   As a tenant
#   I want to add my unit
#   So that I can compare it with other units
# ) do
#
#   # Acceptance criteria
#   # [] If I put in a valid address, number of bedrooms, type of dwelling,
#   # => monthly rent, electric and gas utility, and neighborhood, I should be
#   # => redirected to the show page for the rental unit.
#   # [] If I have missing or invalid information, I should be redirected to the
#   # => new page for rental units.
#   # [] If I try to add an already existing unit, I am redirected to the show
#   # => page for that unit.
#
#   context 'add a new unit' do
#     scenario 'tenant enters valid info' do
#           tenant = FactoryGirl.create(:tenant)
#           sign_in_as_tenant(tenant)
#
#           visit new_rental_unit_path
#
#           fill_in 'Address',
#             with: '33 Harrison Ave Ste 501, Boston, MA 02111'
#           select '1', from: 'number_of_bedrooms'
#           select 'Apartment', from 'type_of_dwelling'
#           fill_in 'number_of'
#     end
#
#     scenario 'tenant enters invalid info' do
#
#     end
#   end
#
#   context 'try to add an existing unit' do
#
#   end
#
# end

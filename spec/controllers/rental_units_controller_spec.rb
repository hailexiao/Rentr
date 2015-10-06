require 'rails_helper'

RSpec.describe RentalUnitsController, type: :controller do

  before (:each) do
    @rental_unit = FactoryGirl.create(:rental_unit)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: @rental_unit.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: @rental_unit.id
      expect(response).to have_http_status(:success)
    end
  end

end

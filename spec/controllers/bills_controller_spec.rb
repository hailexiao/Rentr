require 'rails_helper'

RSpec.describe BillsController, type: :controller do

  before (:each) do
    @bill = FactoryGirl.create(:bill)
    @rental_unit = @bill.rental_unit
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, rental_unit: @rental_unit
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, rental_unit: @rental_unit
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "returns http success" do
      put :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      delete :destroy, id: @bill.id
      expect(response).to have_http_status(302)
    end
  end

end

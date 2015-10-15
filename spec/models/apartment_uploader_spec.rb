require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe ApartmentUploader do
  include CarrierWave::Test::Matchers

  before do
    ApartmentUploader.enable_processing = true
    @rental_unit = FactoryGirl.create(:rental_unit)
    @uploader = ApartmentUploader.new(@rental_unit, :photos)

    File.open('public/images/cambridge-66714_640.jpg') do |f|
      @uploader.store!(f)
    end
  end

  after do
    ApartmentUploader.enable_processing = false
    @uploader.remove!
  end

  context 'full size version' do
    it "should resize the image to 300 pixels wide" do
      @uploader.should be_no_larger_than(300, 400)
    end
  end
end

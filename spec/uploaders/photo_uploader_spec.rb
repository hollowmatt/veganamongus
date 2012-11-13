require 'carrierwave/test/matchers'
require 'spec_helper'
describe PhotoUploader do
  include CarrierWave::Test::Matchers

  before do
    @recipe = FactoryGirl.create(:recipe)
    PhotoUploader.enable_processing = true
    @uploader = PhotoUploader.new(@recipe, :photo)
    @uploader.store!(File.open("/Users/hollowmatt/Pictures/CylonInFace.jpg"))
  end

  after do
    PhotoUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down a landscape image to be exactly 64 by 64 pixels" do
      @uploader.thumb.should be_no_larger_than(50, 50)
    end
  end

  context 'the small version' do
    it "should scale down a landscape image to fit within 200 by 200 pixels" do
      @uploader.should be_no_larger_than(200, 200)
    end
  end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0644)
  end
end
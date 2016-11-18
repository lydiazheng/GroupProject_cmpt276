require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = locations(:SFU_library)
  end

  test "the location should be valid" do
  	assert @location.valid?, @location.errors.full_messages.inspect
  end

  test "the longitude can be absent" do
    @location.longitude = "     "
    assert @location.valid?
  end

  test "the longitude can be any type" do
    valid_longitudes = [
      "aaaa",
      "aaAA",
      "aA12",
      "!!aA",
      "!!112"]
    valid_longitudes.each do |valid_longitude|
     @location.longitude = valid_longitude
     assert @location.valid?
   end
 end
  


  test "the latitude can be absent" do
    @location.latitude = "     "
    assert @location.valid?
   end

  test "the latitude can be any type" do
    valid_latitudes = [
      "aaaa",
      "aaAA",
      "aA12",
      "!!aA",
      "!!112"]
    valid_latitudes.each do |valid_latitude|
     @location.latitude = valid_latitude
     assert @location.valid?
   end
 end
end


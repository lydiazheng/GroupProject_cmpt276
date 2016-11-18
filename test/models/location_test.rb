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

 test "the address can be any type" do
  valid_addresses = [
    "abcdff",
    "12 sdf",
    "!!12 ASD",
    "      "]
  valid_addresses.each do |valid_address|
    @location.address = valid_address
    assert @location.address
  end
end
  
  test "the discription can be any type" do
  valid_discriptions = [
    "abcdff",
    "12 sdf",
    "!!12 ASD",
    "      "]
  valid_discriptions.each do |valid_discription|
    @location.discription = valid_discription
    assert @location.discription
  end
end

  test "the hint1 can be any type" do
  valid_hint1s = [
    "abcdff",
    "12 sdf",
    "!!12 ASD",
    "      ",
    "+-*/ ASD dfsc"]
  valid_hint1s.each do |valid_hint1|
    @location.hint1 = valid_hint1
    assert @location.hint1
  end
end
  
  test "the hint2 can be any type" do
  valid_hint2s = [
    "abcdff",
    "12 sdf",
    "!!12 ASD",
    "      ",
    "+-*/ ASD dfsc"]
  valid_hint2s.each do |valid_hint2|
    @location.hint2 = valid_hint2
    assert @location.hint2
  end
end

  test "the area can be any type" do
  valid_areas = [
    "abcdff",
    "12 sdf",
    "!!12 ASD",
    "      ",
    "+-*/ ASD dfsc"]
  valid_areas.each do |valid_area|
    @location.area = valid_area
    assert @location.area
  end
end

  
end
















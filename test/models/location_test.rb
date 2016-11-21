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

  test "the longitude cannot have special symbol" do
    valid_longitudes = [
      "aaaa",
      "aaAA",
      "!!aA",
      "!!112"]
    valid_longitudes.each do |valid_longitude|
     @location.longitude = valid_longitude
     assert @location.valid?, "#{valid_longitude.inspect} should be valid"
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
      "!!aA",
      "!!112"]
    valid_latitudes.each do |valid_latitude|
     @location.latitude = valid_latitude
     assert @location.valid?, "#{valid_latitude.inspect} should be valid"
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
    assert @location.valid?, "#{valid_address.inspect} should be valid"
  end
end
  
  test "the description can be any type" do
  valid_descriptions = [
    "abcdff",
    "12 sdf",
    "!!12 ASD",
    "      "]
  valid_descriptions.each do |valid_description|
    @location.description = valid_description
    assert @location.valid?, "#{valid_description.inspect} should be valid"
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
    assert @location.valid?, "#{valid_hint1.inspect} should be valid"
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
    assert @location.valid?, "#{valid_hint2.inspect} should be valid"
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
    assert @location.valid?, "#{valid_area.inspect} should be valid"
  end
end

  test "the image file size should less than 4 mb" do
    @location.image_file_size = 5.megabytes
    assert_not @location.valid?
  end
  
  test "the image file size can be 0 mb" do
    @location.image_file_size = 0.megabytes
    assert @location.valid?
  end

  test "the image content type needs / " do
    valid_image_content_types = [
      "imageabcdff",
      "image  ",
      "     ", 
      "ABC"]
  valid_image_content_types.each do |valid_image_content_type|
    @location.image_content_type = valid_image_content_type
    assert_not @location.valid?, "#{valid_image_content_type.inspect} should be valid"
  end
end

  test "the image content type can only with /" do
    @location.image_content_type = "image/ "
    assert @location.valid?
  end

  test "the image content type after can include lowercase letters, uppercase letters, and special symbols" do
    valid_image_content_types = [
      "image/jpg",
      "image/jp+",
      "image/AAA"]
  valid_image_content_types.each do |valid_image_content_type|
    @location.image_content_type = valid_image_content_type
    assert @location.valid?
  end
end




end













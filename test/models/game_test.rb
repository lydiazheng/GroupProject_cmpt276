require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @game = games(:SFU_library)
  end

  test "the game should be valid" do
  	assert @game.valid?, @game.errors.full_messages.inspect
  end

  test "the longitude can be absent" do
    @game.longitude = "     "
    assert @game.valid?
  end

  test "the longitude cannot have special symbol" do
    valid_longitudes = [
      "aaaa",
      "aaAA",
      "!!aA",
      "!!112"]
    valid_longitudes.each do |valid_longitude|
     @game.longitude = valid_longitude
     assert @game.valid?, "#{valid_longitude.inspect} should be valid"
   end
 end
  
  test "the latitude can be absent" do
    @game.latitude = "     "
    assert @game.valid?
   end

  test "the latitude can be any type" do
    valid_latitudes = [
      "aaaa",
      "aaAA",
      "!!aA",
      "!!112"]
    valid_latitudes.each do |valid_latitude|
     @game.latitude = valid_latitude
     assert @game.valid?, "#{valid_latitude.inspect} should be valid"
   end
 end

 test "the address can be any type" do
  valid_addresses = [
    "abcdff",
    "12 sdf",
    "!!12 ASD",
    "      "]
  valid_addresses.each do |valid_address|
    @game.address = valid_address
    assert @game.valid?, "#{valid_address.inspect} should be valid"
  end
end
  
  test "the title can be any type" do
  valid_titles = [
    "abcdff",
    "12 sdf",
    "!!12 ASD",
    "      "]
  valid_titles.each do |valid_title|
    @game.title = valid_title
    assert @game.valid?, "#{valid_title.inspect} should be valid"
  end
end

  test "the duration can be any type" do
  valid_durations = [
    "abcdff",
    "12 sdf",
    "!!12 ASD",
    "      ",
    "+-*/ ASD dfsc"]
  valid_durations.each do |valid_duration|
    @game.duration = valid_duration
    assert @game.valid?, "#{valid_duration.inspect} should be valid"
  end
end




end

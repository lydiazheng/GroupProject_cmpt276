require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @game = games(:SFU_library)
    @game.starts_at_time = 12-06-00
    @game.starts_at_date = 2016-12-05
  end

  test "the game should be valid" do
  	assert @game.valid?, @game.errors.full_messages.inspect
  end

  test "the longitude cannot be absent" do
    @game.longitude = "     "
    assert_not @game.valid?
  end

  test "the longitude must be only in integer" do
    valid_longitudes = [
      "aaaa",
      "aaAA",
      "!!aA",
      "!!112"]
    valid_longitudes.each do |valid_longitude|
     @game.longitude = valid_longitude
     assert_not @game.valid?, "#{valid_longitude.inspect} should be valid"
   end
 end
  
  test "the latitude cannot be absent" do
    @game.latitude = "     "
    assert_not @game.valid?
   end

  test "the latitude must be only in integer" do
    valid_latitudes = [
      "aaaa",
      "aaAA",
      "!!aA",
      "!!112"]
    valid_latitudes.each do |valid_latitude|
     @game.latitude = valid_latitude
     assert_not @game.valid?, "#{valid_latitude.inspect} should be valid"
   end
 end



  test "the title can not be absent" do
    @game.title = "    "
    assert_not @game.valid?
    end

  test "title should not be too long" do
    @game.title = "a" * 65
    assert_not @game.valid?
  end

  test "the title cannot be a combination of numebr, letter(uppercase or lowercase) and symbol" do
  valid_titles = [
    "asdfsd",
    "12 sdf",
    "12"]
  valid_titles.each do |valid_title|
    @game.title = valid_title
    assert_not @game.valid?, "#{valid_title.inspect} should be valid"
  end
end


  test "the duration must be integer" do
  valid_durations = [
    "abcdff",
    "12 sdf",
    "!!12 ASD",
    "      ",
    "+-*/ ASD dfsc"]
  valid_durations.each do |valid_duration|
    @game.duration = valid_duration
    assert_not @game.valid?, "#{valid_duration.inspect} should be valid"
  end
end


  test "duration should be larger than 5 miniutes" do
    @game.duration = 4
    assert_not @game.valid?
  end

  test "duration should be less than 120 miniutes" do
    @game.duration = 121
    assert_not @game.valid?
  end



end

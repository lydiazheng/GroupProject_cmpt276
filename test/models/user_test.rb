require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:john)
    @user.password = "!Password1"
    @user.password_confirmation = "!Password1"
  end

  test "user should be valid" do
    assert @user.valid?, @user.errors.full_messages.inspect
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
   valid_addresses = [
     "user@example.com",
     "UseR@ExamPle.COM",
     "user_CA-fr@example.bc.ca",
     "first.last@example.co",
     "user+test@example.com"]
   valid_addresses.each do |valid_address|
     @user.email = valid_address
     assert @user.valid?, "#{valid_address.inspect} should be valid"
   end
 end

 test "email should not be too long" do
   @user.email = "a" * 244 + "@example.com"
   assert_not @user.valid?
 end

 test "email should be unique" do
    @duplicate_user = @user.dup
    @duplicate_user.username = "not_john"
    assert_not @duplicate_user.valid?
  end

  test "email should be saved as lowercase" do
    email = "John@ExAMPle.CoM"
    @user.email = email
    @user.save
    assert_equal email.downcase, @user.reload.email
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should be 6 characters or more" do
    @user.password = @user.password_confirmation = "1!abC"
    assert_not @user.valid?
  end

  test "password should include uppercase and lowercase letters, digit and symbol" do
    @user.password = @user.password_confirmation = "abcdE!"
    assert_not @user.valid?
    @user.password = @user.password_confirmation = "abcdE1"
    assert_not @user.valid?
    @user.password = @user.password_confirmation = "abcde!1"
    assert_not @user.valid?
    @user.password = @user.password_confirmation = "ABCDE!1"
    assert_not @user.valid?
  end

  test "username should be present" do
    @user.username = "     "
    assert_not @user.valid?
  end

  test "username should not be too long" do
    @user.username = "a" * 65
    assert_not @user.valid?
  end

  test "username should be unique" do
    @duplicate_user = @user.dup
    @duplicate_user.email = "not_john@example.com"
    assert_not @duplicate_user.valid?
  end

  test "firstname should be present" do
    @user.firstname = "     "
    assert_not @user.valid?
  end

  test "firstname should not be too long" do
    @user.firstname = "a" * 65
    assert_not @user.valid?
  end

end

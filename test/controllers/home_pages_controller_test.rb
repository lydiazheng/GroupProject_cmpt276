require 'test_helper'

class HomePagesControllerTest < ActionController::TestCase
  	
  test "should route to user show" do
  	assert_routing '/users/1', {controller: "users", action: "show", id: "1"}
end

  test "should get home" do
    get :home
    assert_response :success
    
  end


  test "should get about" do
  	get :about
  	assert_response :success
  	
  end
end

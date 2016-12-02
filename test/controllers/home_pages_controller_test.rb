require 'test_helper'

class HomePagesControllerTest < ActionController::TestCase
  	
  test "should route to user show" do
  	assert_routing '/users/1', {controller: "users", action: "show", id: "1"}
end

  test "should route to user index" do
  	assert_routing '/users', {controller: "users", action: "index"}
end

test "should route to user edit" do
  	assert_routing '/users/1/edit', {controller: "users", action: "edit", id: "1"}
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

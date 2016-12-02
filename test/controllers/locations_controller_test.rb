require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
 
 test "should route to location index" do
  	assert_routing '/locations', {controller: "locations", action: "index"}
end

test "should route to location edit" do
  	assert_routing '/locations/1/edit', {controller: "locations", action: "edit", id: "1"}
end
end

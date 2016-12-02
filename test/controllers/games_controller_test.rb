require 'test_helper'

class GamesControllerTest < ActionController::TestCase
	test "should route to game index" do
  	assert_routing '/games', {controller: "games", action: "index"}
end


test "should route to game show" do
  	assert_routing '/games/1', {controller: "games", action: "show", id: "1"}
end

test "should route to game edit" do
  	assert_routing '/games/1/edit', {controller: "games", action: "edit", id: "1"}
end

end

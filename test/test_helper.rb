ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

      def is_logged_in?
     !session[:user_id].nil?
   end
 
   # Log in as a particular user.
   def log_in_as(user)
     session[:user_id] = user.id
   end
 
   class ActionDispatch::IntegrationTest
 
   # Log in as a particular user.
   def log_in_as(user, password: 'Passw0rd1!', remember_me: '1')
     post login_path, params: { session: { email: user.email,
                                           password: password,
                                           remember_me: remember_me } }
   end
 end
end

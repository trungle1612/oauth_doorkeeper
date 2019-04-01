ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'mocha/minitest'


class ActiveSupport::TestCase
	class APIControllerTestCase < ActionController::TestCase
	 def setup_api_controller(options = {})
	    if options[:doorkeeper_authorized]
	      @current_user = FactoryGirl.create(:user)
	      doorkeeper_token = @current_user.doorkeeper_tokens.first || @current_user.doorkeeper_tokens.create
	      doorkeeper_token.stubs(:acceptable?).returns(true)
	      @controller.stubs(doorkeeper_token: doorkeeper_token)
	      @controller.current_user.stubs(confirmed?: true) if options[:user_confirmed]
	      @controller.current_user.stubs(verified?: true) if options[:user_confirmed]
	    end
	  @controller.stubs(:render)
	 end
  end
end

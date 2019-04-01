require "test_helper"

class API::BaseControllerTest < ActionController::TestCase
  def test_current_user
  	user = FactoryGirl.create(:user)
    doorkeeper_token = mock('doorkeeper_token')
    doorkeeper_token.stubs(:resource_owner_id).returns(user.id)

  	@controller.stubs(:doorkeeper_token).returns(doorkeeper_token)

  	assert_equal(@controller.current_user, user)
  end

  def test_doorkeeper_unauthorized_render_options
  	description = Faker::Lorem.sentence
  	error = OpenStruct.new(description: description)
  	json = { json: APIStatus::USER_UNAUTHENTICATED.merge(message: error.description, timestamp: Time.now.utc.to_i, data: nil) }

  	assert_equal(@controller.doorkeeper_unauthorized_render_options(error: error), json)
  	assert_equal(error.status, :ok)
  end
end


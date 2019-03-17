class API::BaseController < ActionController::Base
  include API::Rendering

  protect_from_forgery with: :null_session

  layout 'api/layouts/base'

  def current_user
    @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token.present?
  end

  # Render error message in case user unauthenticated
  # Override doorkeppe function
  def doorkeeper_unauthorized_render_options(error: nil)
    error.define_singleton_method(:status){ :ok } if error.present?

    { json: APIStatus::USER_UNAUTHENTICATED.merge(message: error.try(:description), timestamp: Time.now.utc.to_i, data: nil) }
  end
end

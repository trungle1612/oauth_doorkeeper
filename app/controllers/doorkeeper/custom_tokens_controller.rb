class Doorkeeper::CustomTokensController < Doorkeeper::TokensController
  include API::Rendering
  include AbstractController::Rendering
  include ActionView::Layouts

  append_view_path "#{Rails.root}/app/views"

  layout "#{Rails.root}/app/views/api/layouts/base.json"

  def create
    super

    response_json = JSON.parse(response.body)
    @_response_body = nil

    if self.status == 200
      render_success(
        { message: 'Successfully authenticated user' },
        {
          access_token: response_json['access_token'],
          first_login:  (Doorkeeper::AccessToken.where(resource_owner_id: strategy.resource_owner.id).count == 1),
        }
      )
    else
      render_failure_without_template(message: response_json['error_description'])
    end
  rescue => exception
    render_failure_without_template(
      APIStatus::AUTHENTICATION_FAILURE.merge(message: exception.message)
    )
  ensure
    self.status = 200
    self.content_type = 'application/json'
  end

  def revoke
    if authorized?
      revoke_token
    end

    self.content_type = 'application/json'
    render_success_without_template(message: 'Successfully deauthenticated user')
  end
end

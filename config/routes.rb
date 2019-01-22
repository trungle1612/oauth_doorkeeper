Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  use_doorkeeper do
    skip_controllers(
      :applications, :authorizations, :authorized_applications, :token_info
    )
    controllers(token: 'doorkeeper/custom_tokens')
  end
end

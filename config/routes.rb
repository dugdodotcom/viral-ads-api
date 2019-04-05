Rails.application.routes.draw do
  use_doorkeeper
  # devise_for :users
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'api/v1/login',
               sign_out: 'api/v1/logout',
               registration: 'api/v1/signup'
             },
             controllers: {
               sessions: 'api/v1/sessions',
               registrations: 'api/v1/registrations',
               confirmations: 'confirmations',
               omniauth_callbacks: 'api/v1/omniauth_callbacks'
             }, 
             defaults: { format: :json }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      
    #   devise_for :users, controllers: {
    #     omniauth_callbacks: 'omniauth_callbacks'
    #  }, skip: [:sessions, :password]
    end
  end
end

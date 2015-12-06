Rails.application.routes.draw do
  api_version(:module => "Api::V1", :path => {:value => "v1"}, :default => true, :defaults => {:format => :json}) do
    resources :organizations, only: [:index, :create]
    resources :actors, only: [:index, :create]
    resources :sessions, only: [:create, :destroy]
    resources :users, only: [:show, :create]
    resources :issues, only: [:index, :show, :create] do
      resources :feeds do
        get 'verify', to: :verify
      end
    end
  end
end

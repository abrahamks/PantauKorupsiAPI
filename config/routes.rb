Rails.application.routes.draw do
  api_version(:module => "Api::V1", :path => {:value => "v1"}, :default => true) do
    resources :issues
    resources :organizations
    resources :actors
    resources :sessions, only: [:create, :destroy]
    resources :users, only: [:show, :create]
    resources :feeds do
      get 'verify', to: :verify
    end
  end
end

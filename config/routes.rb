Rails.application.routes.draw do
  api_version(:module => "Api::V1", :path => {:value => "v1"}, :default => true, :defaults => {:format => :json}) do
    resources :organizations, only: [:index, :create, :show]
    resources :actors, only: [:index, :create ,:show]
    resources :sessions, only: [:create, :destroy]
    resources :users, only: [:show, :create]
    resources :issues, only: [:index, :show, :create] do
      resources :involvements
      resources :feeds do
        get 'verify', action: :verify
      end
    end
  end
end

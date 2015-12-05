Rails.application.routes.draw do
  api_version(:module => "Api::V1", :path => {:value => "v1"}, :default => true) do
    resources :users
  end
end

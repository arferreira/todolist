require 'ApiVersionConstraint'

Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json}, path: '/' do
      namespace :v1, path: '/', constraints: ApiVersionConstraint.new(version: 1, default: true) do
        resources :tasks
      end
=begin  namespace :v2, path: '/', constraints: ApiVersionConstraint.new(version: 2, default: true) do
        resources :tasks
      end
=end
  end

end

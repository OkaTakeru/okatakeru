Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  resources :post
  get 'tweets' => 'tweets#index'
  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  root 'tweets#index'
  get 'tweets/new' => 'tweets#new'
  post 'tweets' => 'tweets#create'
  delete 'tweets/:id' => 'tweets#destroy' 
  get 'tweets/:id' => 'tweets#show',as: 'tweet'
end

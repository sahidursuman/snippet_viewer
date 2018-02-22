Rails.application.routes.draw do
  root 'snippets#index'
  resources :snippets, only: [:index, :new, :create, :show]
  get 'snippets/view/:slug' => 'snippets#view', as: :snippets_view
end

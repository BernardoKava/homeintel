Rails.application.routes.draw do
  resources :cashflows
  resources :budgets
  resources :banks
  resources :schools
  resources :references
  resources :addresspools
  resources :employments
  resources :qualifications
  resources :addresses
  resources :telephones
  resources :emails
  resources :people
  resources :departments
  resources :inventories
  get 'dashboard/index'
  get 'user/index'
  get 'user/gravatar'
  devise_for :users
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
